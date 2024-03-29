/*
 *  acer_acpi.c - Acer Laptop ACPI Extras
 *
 *
 *  Copyright (C) 2005-2007  E.M. Smith
 *  Copyright (C) 2007       Carlos Corbacho <cathectic@gmail.com>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 *
 *  The devolpment page for this driver is located at
 *  http://code.google.com/p/aceracpi
 *
 *  Credits:
 *
 *  The authors of laptop ACPI modules in the kernel
 *              - their work was an inspiration and a source of good code
 *  Olaf Tauber
 *              - developer of acerhk, the inspiration to solve the 64-bit
 *                driver problem for [Mark Smith's] Aspire 5024.
 *  Mathieu Segaud
 *              - solved the ACPI problem that needed a double-modprobe in
 *                acer_acpi 0.2 and below.
 *  Jim Ramsay
 *              - Figured out and added support for WMID, added generic
 *                interface code
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/types.h>
#include <linux/delay.h>
#include <linux/backlight.h>
#include <linux/platform_device.h>
#include <linux/leds.h>
#include <linux/uaccess.h>
#include <linux/preempt.h>
#include <linux/io.h>
#include <linux/dmi.h>

#include <acpi/acpi_drivers.h>

MODULE_AUTHOR("Mark Smith, Carlos Corbacho");
MODULE_DESCRIPTION("Acer Laptop ACPI Extras Driver");
MODULE_LICENSE("GPL");

/*
 * Defining this enables the 3g interface on the new WMID interface.
 *
 * However, there are many reports of this not working (and no reports of it
 * working), so this is for experienced users only.
 */
#undef EXPERIMENTAL_INTERFACES

#define ACER_LOGPREFIX "acer_acpi: "

#define DEBUG(level, message...) \
	do { \
		if (debug >= level) \
		printk(KERN_DEBUG ACER_LOGPREFIX message); \
	} while (0);

/*
 * On the 5580, brightness values range from 0x0 to 0xf, inclusive.
 * This may vary on other machines or other interfaces.
 */
#define ACER_MAX_BRIGHTNESS 0xf

/*
 * These laptops are known to require a keyboard quirk to make their
 * multimedia keys emit scancodes
 */
static struct dmi_system_id keyboard_dmi_table[] = {
	{
		.ident = "Acer Aspire 5680",
		.matches = {
			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5680"),
		},
	},
	{ }
};

/*
 * Keyboard controller ports
 */
#define ACER_KBD_STATUS_REG	0x64	/* Status register (R) */
#define ACER_KBD_CNTL_REG	0x64	/* Controller command register (W) */
#define ACER_KBD_DATA_REG	0x60	/* Keyboard data register (R/W) */

/*
 * AMW0 EC Magic Number
 * This number is required for writing to ACPI
 * (it's also used in acerhk when directly accessing the EC)
 */
#define ACER_WRITE	0x9610

/*
 * Bit masks for the old AMW0 interface
 */
#define ACER_AMW0_WIRELESS_MASK  0x35
#define ACER_AMW0_BLUETOOTH_MASK 0x34
#define ACER_AMW0_MAILLED_MASK   0x31

/*
 * Method IDs for new WMID interface
 * These could be different for other untested machines
 */
#define ACER_WMID_GET_WIRELESS_METHODID   1
#define ACER_WMID_GET_BLUETOOTH_METHODID  2
#define ACER_WMID_GET_BRIGHTNESS_METHODID 3
#define ACER_WMID_SET_WIRELESS_METHODID   4
#define ACER_WMID_SET_BLUETOOTH_METHODID  5
#define ACER_WMID_SET_BRIGHTNESS_METHODID 6
#define ACER_WMID_GET_THREEG_METHODID 10
#define ACER_WMID_SET_THREEG_METHODID 11

/*
 * Acer ACPI method paths
 *
 * TODO: It may be possbile to autodetect these, since these are all at HID
 * PNP0C14
 */
#define AMW0_METHOD		"\\_SB_.AMW0.WMAB"
#define AMW0_GETDATA		"\\_SB_.AMW0._WED"

#define WMID_METHOD		"\\_SB.WMID.WMBA"
#define WMID_GETDATA		"\\_SB.WMID._WED"

/*
 * Interface capability flags
 */
#define ACER_CAP_MAILLED    (1<<0)
#define ACER_CAP_WIRELESS   (1<<1)
#define ACER_CAP_BLUETOOTH  (1<<2)
#define ACER_CAP_BRIGHTNESS (1<<3)
#define ACER_CAP_THREEG     (1<<4)
#define ACER_CAP_ANY        (0xffffffff)

/*
 * Interface type flags
 */
#define ACER_AMW0 (1<<0)
#define ACER_WMID (1<<1)

/*
 * Presumed start states -
 * For the AMW0 interface, there is no way to know for certain what the start
 * state is for any of the devices (ACPI does not provide any methods or store
 * this anywhere, and a device state will persist across a reboot).
 *
 * The driver therefore changes from the unknown state to a known state (off)
 * (Acer software just waits for the user to press the device button, as the
 * scancode for the button changes when the device state is changed).
 *
 * Also, we can't yet tell which features are enabled or disabled on a specific
 * model, just ranges; but we don't have enough information on the models, so we
 * currently unconditionally enable all supported devices on a given interface.
 *
 * Basically the code works like this:
 *   - On init, any values specified on the commandline are set.
 *   - For interfaces where the current values cannot be detected and which
 *     have not been set on the commandline, we set them to some sane default
 *     (disabled)
 *
 * See AMW0_init and acer_commandline_init
 */

#define ACER_DEFAULT_WIRELESS  0
#define ACER_DEFAULT_BLUETOOTH 0
#define ACER_DEFAULT_MAILLED   0
#define ACER_DEFAULT_THREEG    0
#define ACER_DEFAULT_BRIGHTNESS ACER_MAX_BRIGHTNESS

static int wireless = -1;
static int bluetooth = -1;
static int mailled = -1;
static int brightness = -1;
static int threeg = -1;
static int debug;

module_param(mailled, int, 0444);
module_param(wireless, int, 0444);
module_param(bluetooth, int, 0444);
module_param(brightness, int, 0444);
module_param(threeg, int, 0444);
module_param(debug, int, 0664);
MODULE_PARM_DESC(wireless, "Set initial state of Wireless hardware");
MODULE_PARM_DESC(bluetooth, "Set initial state of Bluetooth hardware");
MODULE_PARM_DESC(mailled, "Set initial state of Mail LED");
MODULE_PARM_DESC(brightness, "Set initial LCD backlight brightness");
MODULE_PARM_DESC(threeg, "Set initial state of 3G hardware");
MODULE_PARM_DESC(debug, "Debugging verbosity level (0=least 2=most)");

static int is_valid_acpi_path(const char *methodName)
{
	acpi_handle handle;
	acpi_status status;

	status = acpi_get_handle(NULL, (char *)methodName, &handle);
	return ACPI_SUCCESS(status);
}

/* Each low-level interface must define at least some of the following */
struct Interface {
	/*
	 * The ACPI device type
	 */
	uint32_t type;


	/*
	 * The capabilities this interface provides
	 * In the future, these can be removed/added at runtime when we have a
	 * way of detecting what capabilities are /actually/ present on an
	 * interface
	 */
	uint32_t capability;

	/*
	 * Initializes an interface, should allocate the interface-specific
	 * data
	 */
	void (*init) (struct Interface *);

	/*
	 * Frees an interface, should free the interface-specific data
	 */
	void (*free) (struct Interface *);

	/*
	 * Gets and sets various data types.
	 *   First paramater:  Value to set, or pointer to place got value into
	 *   Second parameter: Specific capability being requested
	 *   Third paramater: Pointer to this interface
	 */
	acpi_status (*get_bool) (bool *, uint32_t, struct Interface *);
	acpi_status (*set_bool) (bool, uint32_t, struct Interface *);
	acpi_status (*get_u8) (uint8_t *, uint32_t, struct Interface *);
	acpi_status (*set_u8) (uint8_t, uint32_t, struct Interface *);

	/*
	 * Interface-specific private data member.  Must *not* be touched by
	 * anyone outside of this struct
	 */
	void *data;
};

/* The static interface pointer, points to the currently detected interface */
static struct Interface *interface;

/*
 * General interface convenience methods
 */

static bool has_cap(uint32_t cap)
{
	if ((interface->capability & cap) != 0) {
		return 1;
	}
	return 0;
}

static void interface_free(struct Interface *iface)
{
	/* Free our private data structure */
	kfree(iface->data);
}

/* These *_via_u8 use the interface's *_u8 methods to emulate other gets/sets */
static acpi_status get_bool_via_u8(bool *value, uint32_t cap,
	struct Interface *iface)
{
	acpi_status status;
	uint8_t result;

	status = iface->get_u8(&result, cap, iface);

	if (ACPI_SUCCESS(status))
		*value = (result != 0);

	return status;
}

static acpi_status set_bool_via_u8(bool value, uint32_t cap,
	struct Interface *iface)
{
	uint8_t v = value ? 1 : 0;

	return iface->set_u8(v, cap, iface);
}

/* General wrapper around the ACPI call */
static acpi_status
WMI_execute(char *methodPath, uint32_t methodId, const struct acpi_buffer *in,
	struct acpi_buffer *out)
{
	struct acpi_object_list input;
	union acpi_object params[3];
	acpi_status status = AE_OK;

	/* WMI calling convention:
	 *  methodPath( instance, methodId, input_buffer )
	 *    - instance is always 1, since there's only this module
	 *    - methodId is the method number within the current method group.
	 *    - Input buffer is ignored for read-only commands
	 *    - May return a buffer of results (optional)
	 */
	input.count = 3;
	input.pointer = params;
	params[0].type = ACPI_TYPE_INTEGER;
	params[0].integer.value = 0x01;
	params[1].type = ACPI_TYPE_INTEGER;
	params[1].integer.value = methodId;
	params[2].type = ACPI_TYPE_BUFFER;
	params[2].buffer.length = in->length;
	params[2].buffer.pointer = in->pointer;

	DEBUG(2, "Doing %s( 1, %u, [%llu-byte buffer] )\n", methodPath,
	methodId, (uint64_t)in->length);

	status = acpi_evaluate_object(NULL, methodPath, &input, out);

	DEBUG(2, "  Execution status: %d\n", status);
	DEBUG(2, "  Result: %llu bytes\n", (uint64_t)(out ? out->length : 0) );

	return status;
}

/*
 * Keyboard quirk
 */

/*
 * Wait for the keyboard controller to become ready
 */
static int wait_kbd_write(void)
{
	int i = 0;
	while ((inb(ACER_KBD_STATUS_REG) & 0x02) && (i < 10000)) {
		udelay(50);
		i++;
	}
	return -(i == 10000);
}

static void set_keyboard_quirk(void)
{
	preempt_disable();
	if (!wait_kbd_write()) {
		outb(0x59, ACER_KBD_CNTL_REG);
		if (!wait_kbd_write())
			outb(0x90, ACER_KBD_DATA_REG);
	} else {
		printk(KERN_ERR ACER_LOGPREFIX "Unable to apply keyboard \
		quirk\n");
	}
	preempt_enable_no_resched();
}

/*
 * Check if this system requires the keyboard quirk to enable multimedia keys
 */
static bool keyboard_quirk(void)
{
	if (dmi_check_system(keyboard_dmi_table))
		return 1;
	return 0;
}

/*
 * Old interface (now known as the AMW0 interface)
 */
struct WMAB_args {
	u32 eax;
	u32 ebx;
	u32 ecx;
	u32 edx;
};

struct AMW0_Data {
	int mailled;
	int wireless;
	int bluetooth;
};

static acpi_status WMAB_execute(struct WMAB_args *regbuf,
	struct acpi_buffer *result)
{
	struct acpi_buffer input;
	acpi_status status;
	input.length = sizeof(struct WMAB_args);
	input.pointer = (u8 *)regbuf;

	status = WMI_execute( AMW0_METHOD, 1, &input, result);
	DEBUG(2, "  Args: 0x%08x 0x%08x 0x%08x 0x%08x\n", regbuf->eax,
		regbuf->ebx, regbuf->ecx, regbuf->edx );

	return status;
}

static void AMW0_init(struct Interface *iface)
{
	struct AMW0_Data *data;

	/* Allocate our private data structure */
	iface->data = kmalloc(sizeof(struct AMW0_Data), GFP_KERNEL);
	data = (struct AMW0_Data *)iface->data;

	/*
	 * If the commandline doesn't specify these, we need to force them to
	 * the default values
	 */
	if (mailled == -1)
		mailled = ACER_DEFAULT_MAILLED;
	if (wireless == -1)
		wireless = ACER_DEFAULT_WIRELESS;
	if (bluetooth == -1)
		bluetooth = ACER_DEFAULT_BLUETOOTH;

	/*
	 * Set the cached "current" values to impossible ones so that
	 * acer_commandline_init will definitely set them.
	 */
	data->wireless = data->mailled = data->bluetooth = -1;
}

static acpi_status AMW0_get_bool(bool *value, uint32_t cap,
	struct Interface *iface)
{
	struct AMW0_Data *data = iface->data;

	/*
	 * Currently no way to query the state, so just return the cached
	 * value
	 */
	switch (cap) {
	case ACER_CAP_MAILLED:
		*value = data->mailled;
		break;
	case ACER_CAP_WIRELESS:
		*value = data->wireless;
		break;
	case ACER_CAP_BLUETOOTH:
		*value = data->bluetooth;
		break;
	default:
		return AE_BAD_ADDRESS;
	}
	return AE_OK;
}

static acpi_status AMW0_set_bool(bool value, uint32_t cap,
	struct Interface *iface)
{
	struct WMAB_args args;
	acpi_status status;

	args.eax = ACER_WRITE;
	args.ebx = value ? (1<<8) : 0;

	switch (cap) {
	case ACER_CAP_MAILLED:
		args.ebx |= ACER_AMW0_MAILLED_MASK;
		break;
	case ACER_CAP_WIRELESS:
		args.ebx |= ACER_AMW0_WIRELESS_MASK;
		break;
	case ACER_CAP_BLUETOOTH:
		args.ebx |= ACER_AMW0_BLUETOOTH_MASK;
		break;
	default:
		return AE_BAD_ADDRESS;
	}

	/* Actually do the set */
	status = WMAB_execute(&args, NULL);

	/*
	 * Currently no way to query the state, so cache the new value on
	 * success
	 */
	if (ACPI_SUCCESS(status)) {
		struct AMW0_Data *data = iface->data;
		switch (cap) {
		case ACER_CAP_MAILLED:
			data->mailled = value;
			break;
		case ACER_CAP_WIRELESS:
			data->wireless = value;
			break;
		case ACER_CAP_BLUETOOTH:
			data->bluetooth = value;
			break;
		}
	}

	return status;
}

static struct Interface AMW0_interface = {
	.type = ACER_AMW0,
	.capability = (
		ACER_CAP_MAILLED |
		ACER_CAP_WIRELESS |
		ACER_CAP_BLUETOOTH
	),
	.init = AMW0_init,
	.free = interface_free,
	.get_bool = AMW0_get_bool,
	.set_bool = AMW0_set_bool,
};

/*
 * New interface (The WMID interface)
 */
struct WMID_Data {
	int mailled;
	int wireless;
	int bluetooth;
#ifdef EXPERIMENTAL_INTERFACES
	int threeg;
#endif
	int brightness;
};

static void WMID_init(struct Interface *iface)
{
	struct WMID_Data *data;

	/* Allocate our private data structure */
	iface->data = kmalloc(sizeof(struct WMID_Data), GFP_KERNEL);
	data = (struct WMID_Data *)iface->data;
}

static acpi_status WMI_execute_uint32(uint32_t methodId, uint32_t in,
	uint32_t *out)
{
	struct acpi_buffer input = {(acpi_size)sizeof(uint32_t), (void *)(&in)};
	struct acpi_buffer result = {ACPI_ALLOCATE_BUFFER, NULL};
	union acpi_object *obj;
	uint32_t tmp;
	acpi_status status;

	status = WMI_execute(WMID_METHOD, methodId, &input, &result);
	DEBUG(2, "  In: 0x%08x\n", in);

	if (ACPI_FAILURE(status))
		return status;

	obj = (union acpi_object *)result.pointer;
	if (obj && obj->type == ACPI_TYPE_BUFFER &&
	obj->buffer.length == sizeof(uint32_t)) {
		tmp = * ((uint32_t *)obj->buffer.pointer);
		DEBUG(2, "  Out: 0x%08x\n", tmp);
	} else {
		tmp = 0;
		if (obj) {
			DEBUG(2, "  Got unexpected result of type %d\n",
			obj->type);
		} else {
			DEBUG(2, "  Got unexpected null result\n");
		}
	}

	if (out)
		*out = tmp;

	if (result.length > 0 && result.pointer)
		kfree(result.pointer);

	return status;
}

static acpi_status WMID_get_u8(uint8_t *value, uint32_t cap,
	struct Interface *iface)
{
	acpi_status status;
	uint32_t result;
	uint32_t methodId = 0;

	switch (cap) {
	case ACER_CAP_WIRELESS:
		methodId = ACER_WMID_GET_WIRELESS_METHODID;
		break;
	case ACER_CAP_BLUETOOTH:
		methodId = ACER_WMID_GET_BLUETOOTH_METHODID;
		break;
	case ACER_CAP_BRIGHTNESS:
		methodId = ACER_WMID_GET_BRIGHTNESS_METHODID;
		break;
	case ACER_CAP_THREEG:
		methodId = ACER_WMID_GET_THREEG_METHODID;
		break;
	default:
		return AE_BAD_ADDRESS;
	}
	status = WMI_execute_uint32(methodId, 0, &result);

	if (ACPI_SUCCESS(status))
		*value = (uint8_t)result;

	return status;
}

static acpi_status WMID_set_u8(uint8_t value, uint32_t cap,
	struct Interface *iface)
{
	uint32_t methodId = 0;

	switch (cap) {
	case ACER_CAP_BRIGHTNESS:
		methodId = ACER_WMID_SET_BRIGHTNESS_METHODID;
		break;
	case ACER_CAP_WIRELESS:
		methodId = ACER_WMID_SET_WIRELESS_METHODID;
		break;
	case ACER_CAP_BLUETOOTH:
		methodId = ACER_WMID_SET_BLUETOOTH_METHODID;
		break;
	case ACER_CAP_THREEG:
		methodId = ACER_WMID_SET_THREEG_METHODID;
		break;
	default:
		return AE_BAD_ADDRESS;
	}
	return WMI_execute_uint32(methodId, (uint32_t)value, NULL);
}


static struct Interface WMID_interface = {
	.type = ACER_WMID,
	.capability = (
		ACER_CAP_WIRELESS
		| ACER_CAP_BRIGHTNESS
		| ACER_CAP_BLUETOOTH
#ifdef EXPERIMENTAL_INTERFACES
		| ACER_CAP_THREEG
#endif
	),
	.init = WMID_init,
	.free = interface_free,
	.get_bool = get_bool_via_u8,
	.set_bool = set_bool_via_u8,
	.get_u8 = WMID_get_u8,
	.set_u8 = WMID_set_u8,
};

/*
 * Generic Device (interface-independent)
 */

static acpi_status get_bool(bool *value, uint32_t cap)
{
	acpi_status status = AE_BAD_ADDRESS;
	if (interface->get_bool)
		status = interface->get_bool(value, cap, interface);
	return status;
}

static acpi_status set_bool(int value, uint32_t cap)
{
	acpi_status status = AE_BAD_PARAMETER;
	if ((value == 0 || value == 1) &&
			(interface->capability & cap)) {
		if (interface->set_bool)
			status = interface->set_bool(value == 1, cap,
			interface);
	}
	return status;
}

static acpi_status get_u8(uint8_t *value, uint32_t cap)
{
	acpi_status status = AE_BAD_ADDRESS;
	if (interface->get_u8)
		status = interface->get_u8(value, cap, interface);
	return status;
}

static acpi_status set_u8(uint8_t value, uint8_t min, uint8_t max, uint32_t cap)
{
	acpi_status status = AE_BAD_PARAMETER;
	if ((value >= min && value <= max) &&
			(interface->capability & cap) ) {
		if (interface->get_u8) {
			/* If possible, only set if the value has changed */
			uint8_t actual;
			status = interface->get_u8(&actual, cap, interface);
			if (ACPI_SUCCESS(status) && actual == value)
				return status;
		}
		if (interface->set_u8)
			status = interface->set_u8(value, cap, interface);
	}
	return status;
}

/* Each _u8 needs a small wrapper that sets the boundary values */
static acpi_status set_brightness(uint8_t value)
{
	return set_u8(value, 0, ACER_MAX_BRIGHTNESS, ACER_CAP_BRIGHTNESS);
}

static void acpi_commandline_init(void)
{
	DEBUG(1, "Commandline args: mailled(%d) wireless(%d) bluetooth(%d) \
		brightness(%d)\n",
		mailled, wireless, bluetooth, brightness);

	/*
	 * These will all fail silently if the value given is invalid, or the
	 * capability isn't available on the given interface
	 */
	set_bool(mailled, ACER_CAP_MAILLED);
	set_bool(wireless, ACER_CAP_WIRELESS);
	set_bool(bluetooth, ACER_CAP_BLUETOOTH);
	set_bool(threeg, ACER_CAP_THREEG);
	set_brightness((uint8_t)brightness);
}

/*
 * Backlight device (UNTESTED!)
 */
static struct backlight_device *acer_backlight_device;

static int read_brightness(struct backlight_device *bd)
{
	uint8_t value;
	get_u8(&value, ACER_CAP_BRIGHTNESS);
	return value;
}

static int update_bl_status(struct backlight_device *bd)
{
	set_brightness(bd->props.brightness);
	return 0;
}

static struct backlight_ops acer_backlight_ops = {
	.get_brightness = read_brightness,
	.update_status = update_bl_status,
};

static int acer_backlight_init(struct device *dev)
{
	struct backlight_device *bd;

	DEBUG(1, "Loading backlight driver\n");
	bd = backlight_device_register("acer_acpi", dev,
				       NULL, &acer_backlight_ops);
	if (IS_ERR(bd)) {
		printk(KERN_ERR ACER_LOGPREFIX
		       "Could not register Acer backlight device\n");
		acer_backlight_device = NULL;
		return PTR_ERR(bd);
	}

	acer_backlight_device = bd;

	bd->props.max_brightness = ACER_MAX_BRIGHTNESS;
	bd->props.brightness = read_brightness(NULL);
	backlight_update_status(bd);
	return 0;
}

static void acer_backlight_exit(void)
{
	backlight_device_unregister(acer_backlight_device);
}

/*
 * LED device (Mail LED only, no other LEDs known yet)
 */
static void mail_led_set(struct led_classdev *led_cdev,
	enum led_brightness value)
{
	bool tmp = value;
	set_bool(tmp, ACER_CAP_MAILLED);
}

static struct led_classdev mail_led = {
	.name = "acer_acpi:mail",
	.brightness_set = mail_led_set,
};

static void acer_led_init(struct device *dev)
{
	led_classdev_register(dev, &mail_led);
}

static void acer_led_exit(void)
{
	led_classdev_unregister(&mail_led);
}

/*
 * Platform device
 */

#define show_set_bool(value, cap) \
static ssize_t \
show_bool_##value(struct device *dev, struct device_attribute *attr, \
	char *buf) \
{ \
	bool result; \
	acpi_status status = get_bool(&result, cap); \
	if (ACPI_SUCCESS(status)) \
		return sprintf(buf, "%d\n", result); \
	return sprintf(buf, "Read error" ); \
} \
\
static ssize_t \
set_bool_##value(struct device *dev, struct device_attribute *attr, \
	const char *buf, \
	size_t count) \
{ \
	bool tmp = simple_strtoul(buf, NULL, 10); \
	acpi_status status = set_bool(tmp, cap); \
		if (ACPI_FAILURE(status)) \
			return -EINVAL; \
	return count; \
} \
static DEVICE_ATTR(value, S_IWUGO | S_IRUGO | S_IWUSR, \
	show_bool_##value, set_bool_##value);

show_set_bool(wireless, ACER_CAP_WIRELESS);
show_set_bool(bluetooth, ACER_CAP_BLUETOOTH);
#ifdef EXPERIMENTAL_INTERFACES
show_set_bool(threeg, ACER_CAP_THREEG);
#endif

static struct platform_driver acer_platform_driver = {
	.driver = {
		.name = "acer_acpi",
		.owner = THIS_MODULE,
		}
};

static struct platform_device *acer_platform_device;

static int remove_sysfs(struct platform_device *device)
{
	#define remove_device_file(value, cap) \
	do { \
		if (has_cap(cap)) \
			device_remove_file(&device->dev, &dev_attr_##value); \
	} while (0);

	remove_device_file(wireless, ACER_CAP_WIRELESS);
	remove_device_file(bluetooth, ACER_CAP_BLUETOOTH);
#ifdef EXPERIMENTAL_INTERFACES
	remove_device_file(threeg, ACER_CAP_THREEG);
#endif
	return 0;
}

static int acer_platform_add(void)
{
	int retval = -ENOMEM;
	platform_driver_register(&acer_platform_driver);

	acer_platform_device = platform_device_alloc("acer_acpi", -1);

	platform_device_add(acer_platform_device);

	#define add_device_file(value, cap) \
	do { \
		if (has_cap(cap)) {\
			retval = device_create_file(\
			&acer_platform_device->dev, &dev_attr_##value);\
			if (retval)\
				goto error;\
		} \
	} while (0);

	add_device_file(wireless, ACER_CAP_WIRELESS);
	add_device_file(bluetooth, ACER_CAP_BLUETOOTH);
#ifdef EXPERIMENTAL_INTERFACES
	add_device_file(threeg, ACER_CAP_THREEG);
#endif

	return 0;

error:
	remove_sysfs(acer_platform_device);
	return retval;
}

static void acer_platform_remove(void)
{
	remove_sysfs(acer_platform_device);
	platform_device_del(acer_platform_device);
	platform_driver_unregister(&acer_platform_driver);
}

/*
 * ACPI driver
 */
static int acer_acpi_add(struct acpi_device *device)
{
	struct device *dev = acpi_get_physical_device(device->handle);
	acer_platform_add();
	if (has_cap(ACER_CAP_MAILLED))
		acer_led_init(dev);
	if (has_cap(ACER_CAP_BRIGHTNESS))
		acer_backlight_init(dev);
	return 0;
}

static int acer_acpi_remove(struct acpi_device *device, int type)
{
	acer_platform_remove();

	if (has_cap(ACER_CAP_MAILLED))
		acer_led_exit();
	if (has_cap(ACER_CAP_BRIGHTNESS))
		acer_backlight_exit();
	return 0;
}

#ifdef CONFIG_PM
static int acer_acpi_suspend(struct acpi_device *device, pm_message_t state)
{
	/*
	 * WMID fix for suspend-to-disk - save all current states now so we can
	 * restore them on resume
	 */
	bool value;
	uint8_t u8value;

	#define save_bool_device(device, cap) \
	do { \
		if (has_cap(cap)) {\
			get_bool(&value, cap);\
			data->device = value;\
		} \
	} while (0);

	#define save_u8_device(device, cap) \
	do { \
		if (has_cap(cap)) {\
			get_u8(&u8value, cap);\
			data->device = u8value;\
		} \
	} while (0);

	if (interface->type == ACER_WMID) {
		struct WMID_Data *data = interface->data;
		save_bool_device(wireless, ACER_CAP_WIRELESS);
		save_bool_device(bluetooth, ACER_CAP_BLUETOOTH);
#ifdef EXPERIMENTAL_INTERFACES
		save_bool_device(threeg, ACER_CAP_THREEG);
#endif
		save_u8_device(brightness, ACER_CAP_BRIGHTNESS);
	}

	return 0;
}

static int acer_acpi_resume(struct acpi_device *device)
{
	#define restore_bool_device(device, cap) \
	do { \
		if (has_cap((cap)))\
			set_bool(data->device, (cap));\
	} while (0);

	/*
	 * We must _always_ restore AMW0's values, otherwise the values
	 * after suspend-to-disk are wrong
	 */
	if (interface->type == ACER_AMW0) {
		struct AMW0_Data *data = interface->data;

		restore_bool_device(wireless, ACER_CAP_WIRELESS);
		restore_bool_device(bluetooth, ACER_CAP_BLUETOOTH);
		restore_bool_device(mailled, ACER_CAP_MAILLED);
	} else if (interface->type == ACER_WMID) {
		struct WMID_Data *data = interface->data;

		if (has_cap(ACER_CAP_BRIGHTNESS))
			set_brightness((uint8_t)data->brightness);
#ifdef EXPERIMENTAL_DEVICES
		restore_bool_device(threeg, THREEG);
#endif
		restore_bool_device(wireless, ACER_CAP_WIRELESS);
		restore_bool_device(bluetooth, ACER_CAP_BLUETOOTH);
	}

	/* Check if this laptop requires the keyboard quirk */
	if (keyboard_quirk()) {
		set_keyboard_quirk();
		printk(KERN_INFO ACER_LOGPREFIX "Setting keyboard quirk to \
		enable multimedia keys\n");
	}

	return 0;
}
#else
#define acer_acpi_suspend NULL
#define acer_acpi_resume NULL
#endif

static struct acpi_driver acer_acpi_driver = {
	.name = "acer_acpi",
	.class = "acer",
	.ids = "PNP0C14",
	.ops = {
		.add = acer_acpi_add,
		.remove = acer_acpi_remove,
		.suspend = acer_acpi_suspend,
		.resume = acer_acpi_resume,
		},
};

static int __init acer_acpi_init(void)
{
	acpi_status status = AE_OK;

	printk(KERN_INFO ACER_LOGPREFIX "Acer Laptop ACPI Extras\n");
	if (acpi_disabled) {
		printk(KERN_ERR ACER_LOGPREFIX "ACPI Disabled, unable to \
		load.\n");
		return -ENODEV;
	}

	/*
	 * Detect which WMI interface we're using.
	 *
	 * TODO: This could be more dynamic, and perhaps done in part by the
	 *       acpi_bus driver?
	 */
	if (is_valid_acpi_path(AMW0_METHOD)) {
		DEBUG(0, "Detected Acer AMW0 interface\n");
		interface = &AMW0_interface;
		/* .ids is case sensitive - and AMW0 has a mixed case device */
		acer_acpi_driver.ids = "pnp0c14";
	} else if (is_valid_acpi_path(WMID_METHOD)) {
		DEBUG(0, "Detected Acer WMID interface\n");
		interface = &WMID_interface;
	} else {
		printk(KERN_ERR ACER_LOGPREFIX "No or unsupported WMI \
		interface, unable to load.\n");
		goto error_no_interface;
	}

	/* Now that we have a known interface, initialize it */
	if (interface->init)
		interface->init(interface);

	/*
	 * Register the driver
	 *
	 * TODO: Can we use the bus detection code to check for the interface
	 *       or all or part of the method ID path?
	 */
	status = acpi_bus_register_driver(&acer_acpi_driver);
	if (ACPI_FAILURE(status)) {
		printk(KERN_ERR ACER_LOGPREFIX "Unable to register driver, \
		aborting.\n");
		goto error_acpi_bus_register;
	}

	/* Check if this laptop requires the keyboard quirk */
	if (keyboard_quirk()) {
		set_keyboard_quirk();
		printk(KERN_INFO ACER_LOGPREFIX "Setting keyboard quirk to \
		enable multimedia keys\n");
	}

	/*
	 * Finally, override any initial settings with values from the
	 * command line
	 */
	acpi_commandline_init();

	return status;

error_acpi_bus_register:
error_no_interface:
	return -ENODEV;
}

static void __exit acer_acpi_exit(void)
{
	acpi_bus_unregister_driver(&acer_acpi_driver);

	if (interface->free)
		interface->free(interface);

	printk(KERN_INFO ACER_LOGPREFIX "Acer Laptop ACPI Extras unloaded\n");
	return;
}

module_init(acer_acpi_init);
module_exit(acer_acpi_exit);
