/*
 *  acer_acpi.c - Acer Laptop ACPI Extras
 *
 *
 *  Copyright (C) 2005      E.M. Smith
 *  Copyright (C) 2007      Carlos Corbacho <cathectic@gmail.com>
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
 *  John Belmonte - the Toshiba ACPI driver I've adapted for this module.
 *  Julien Lerouge & Karol Kozimor - ASUS Acpi driver authors.
 *  Olaf Tauber - developer of acerhk, the inspiration to solve the 64-bit
 *                driver problem for [Mark Smith's] Aspire 5024.
 *  Mathieu Segaud - solved the ACPI problem that needed a double-modprobe
 *                   in version 0.2 and below.
 *  Carlos Corbacho - added initial status support for wireless/ mail/
 *                    bluetooth, added module parameter support to turn
 *                    hardware/ LEDs on and off at module loading (thanks
 *                    again to acerhk for the inspiration)
 *  Jim Ramsay - Figured out and added support for WMID interface
 *
 */

#define ACER_ACPI_VERSION	"0.7"
#define PROC_INTERFACE_VERSION	1
#define PROC_ACER		"acer"

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/types.h>
#include <linux/proc_fs.h>
#include <linux/delay.h>
#include <linux/suspend.h>
#include <linux/platform_device.h>
#include <asm/uaccess.h>

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

#define MY_LOGPREFIX "acer_acpi: "
#define MY_ERR KERN_ERR MY_LOGPREFIX
#define MY_NOTICE KERN_NOTICE MY_LOGPREFIX
#define MY_INFO KERN_INFO MY_LOGPREFIX

#define DEBUG(level, message...) { \
	if (debug >= level) \
		printk(KERN_DEBUG MY_LOGPREFIX message);\
}

/*
 * On the 5580, brightness values range from 0x0 to 0xf, inclusive.
 * This may vary on other machines or other interfaces.
 */
#define ACER_MAX_BRIGHTNESS 0xf

/*
 * Magic Number -
 * Meaning is unknown - this number is required for writing to ACPI
 * (it's also used in acerhk when directly accessing the EC)
 */
#define ACER_WRITE	0x9610

/*
 * Bit masks for the old AMW0 interface
 * These could vary between the particular interface
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
 * TODO: It may be possbile to autodetect these, since these are all at HID PNP0C14
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
 * Presumed start states -
 * For the old-style interfaces, there is no way to know for certain what the start state
 * is for any of the parameters (ACPI does not provide any methods or store this
 * anywhere). We therefore start with an unknown state (this is also how acerhk
 * does it); we then change the status so that we are in a known state (I
 * suspect LaunchManager on Windows does something similar, since the  wireless
 * appears to turn off as soon as it launches).
 *
 * Plus, we can't tell which features are enabled or disabled on a specific
 * model, just ranges - e.g. The 5020 series can _support_ bluetooth; but the
 * 5021 has no bluetooth, whilst the 5024 does.  However, the BIOS identifies
 * both laptops as 5020 - we can't tell them apart!
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
static int debug = 0;

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
typedef struct _Interface {
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
	acpi_status (*init) (struct _Interface*);

	/*
	 * Frees an interface, should free the interface-specific data
	 */
	void (*free) (struct _Interface*);

	/*
	 * Gets and sets various data types.
	 *   First paramater:  Value to set, or pointer to place got value into
	 *   Second parameter: Specific capability being requested
	 *   Third paramater: Pointer to this interface
	 */
	acpi_status (*get_bool) (bool*, uint32_t, struct _Interface*);
	acpi_status (*set_bool) (bool, uint32_t, struct _Interface*);
	acpi_status (*get_u8) (uint8_t*, uint32_t, struct _Interface*);
	acpi_status (*set_u8) (uint8_t, uint32_t, struct _Interface*);

	/*
	 * Interface-specific private data member.  Must *not* be touched by
	 * anyone outside of this struct
	 */
	void *data;
} Interface;

/* The static interface pointer, points to the currently detected interface */
static Interface *interface;

/*
 * General interface convenience methods
 */

/* These *_via_u8 use the interface's *_u8 methods to emulate other gets/sets */
static acpi_status get_bool_via_u8(bool *value, uint32_t cap, Interface *iface) {
	acpi_status status;
	uint8_t result;

	status = iface->get_u8(&result, cap, iface);

	if (ACPI_SUCCESS(status))
		*value = (result != 0);

	return status;
}

static acpi_status set_bool_via_u8(bool value, uint32_t cap, Interface *iface) {
	uint8_t v = value ? 1 : 0;

	return iface->set_u8(v, cap, iface);
}

/* General wrapper around the ACPI call */
static acpi_status
WMI_execute(char *methodPath, uint32_t methodId, const struct acpi_buffer *in, struct acpi_buffer *out) {
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

	DEBUG(2, "Doing %s( 1, %u, [%llu-byte buffer] )\n", methodPath, methodId, (uint64_t)in->length);

	status = acpi_evaluate_object(NULL, methodPath, &input, out);

	DEBUG(2, "  Execution status: %d\n", status);
	DEBUG(2, "  Result: %llu bytes\n", (uint64_t)(out ? out->length : 0) );

	return status;
}


/*
 * Old interface (now known as the AMW0 interface)
 */
typedef struct _WMAB_args {
	u32 eax;
	u32 ebx;
	u32 ecx;
	u32 edx;
} WMAB_args;

typedef struct _AMW0_Data {
	int mailled;
	int wireless;
	int bluetooth;
} AMW0_Data;

static acpi_status WMAB_execute(WMAB_args * regbuf, struct acpi_buffer *result)
{
	struct acpi_buffer input;
	acpi_status status;
	input.length = sizeof(WMAB_args);
	input.pointer = (u8*)regbuf;

	status = WMI_execute( AMW0_METHOD, 1, &input, result);
	DEBUG(2, "  Args: 0x%08x 0x%08x 0x%08x 0x%08x\n", regbuf->eax, regbuf->ebx, regbuf->ecx, regbuf->edx );

	return status;
}

static acpi_status AMW0_init(Interface *iface) {
	AMW0_Data *data;

	/* Allocate our private data structure */
	iface->data = kmalloc(sizeof(AMW0_Data), GFP_KERNEL);
	data = (AMW0_Data*)iface->data;

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

	return AE_OK;
}

static void AMW0_free(Interface *iface) {
	/* Free our private data structure */
	kfree(iface->data);
}

static acpi_status AMW0_get_bool(bool *value, uint32_t cap, Interface *iface)
{
	AMW0_Data *data = iface->data;

	/* Currently no way to query the state, so just return the cached value */
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

static acpi_status AMW0_set_bool(bool value, uint32_t cap, Interface *iface)
{
	WMAB_args args;
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
		AMW0_Data *data = iface->data;
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

static Interface AMW0_interface = {
	.capability = (
		ACER_CAP_MAILLED |
		ACER_CAP_WIRELESS |
		ACER_CAP_BLUETOOTH
	),
	.init = AMW0_init,
	.free = AMW0_free,
	.get_bool = AMW0_get_bool,
	.set_bool = AMW0_set_bool,
};

/*
 * New interface (The WMID interface)
 */

static acpi_status
WMI_execute_uint32(uint32_t methodId, uint32_t in, uint32_t *out)
{       
	struct acpi_buffer input = { (acpi_size)sizeof(uint32_t), (void*)(&in) };
	struct acpi_buffer result = { ACPI_ALLOCATE_BUFFER, NULL };
	union acpi_object *obj;
	uint32_t tmp;
	acpi_status status;

	status = WMI_execute(WMID_METHOD, methodId, &input, &result);
	DEBUG(2, "  In: 0x%08x\n", in);

	if (ACPI_FAILURE(status))
		return status;

	obj = (union acpi_object *)result.pointer;
	if (obj && obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == sizeof(uint32_t)) {
		tmp = *((uint32_t*)obj->buffer.pointer);
		DEBUG(2, "  Out: 0x%08x\n", tmp);
	} else {
		tmp = 0;
		if (obj) {
			DEBUG(2, "  Got unexpected result of type %d\n", obj->type);
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

static acpi_status WMID_get_u8(uint8_t *value, uint32_t cap, Interface *iface) {
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

static acpi_status WMID_set_u8(uint8_t value, uint32_t cap, Interface *iface) {
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


static Interface WMID_interface = {
	.capability = (
		ACER_CAP_WIRELESS
		| ACER_CAP_BRIGHTNESS
		| ACER_CAP_BLUETOOTH
#ifdef EXPERIMENTAL_INTERFACES
		| ACER_CAP_THREEG
#endif
	),
	.get_bool = get_bool_via_u8,
	.set_bool = set_bool_via_u8,
	.get_u8 = WMID_get_u8,
	.set_u8 = WMID_set_u8,
	.data = NULL,
};

/*
 * Generic Device (interface-independent)
 */

static acpi_status get_bool(bool *value, uint32_t cap) {
	acpi_status status = AE_BAD_ADDRESS;
	if (interface->get_bool)
		status = interface->get_bool(value, cap, interface);
	return status;
}

static acpi_status set_bool(int value, uint32_t cap) {
	acpi_status status = AE_BAD_PARAMETER;
	if ((value == 0 || value == 1) &&
			(interface->capability & cap)) {
		if (interface->get_bool) {
			/* If possible, only set if the value has changed */
			bool actual;
			status = interface->get_bool(&actual, cap, interface);
			if (ACPI_SUCCESS(status) && actual == (bool)value)
				return status;
		}
		if (interface->set_bool) 
			status = interface->set_bool(value == 1, cap, interface);
	}
	return status;
}

static acpi_status get_u8(uint8_t *value, uint32_t cap) {
	acpi_status status = AE_BAD_ADDRESS;
	if (interface->get_u8)
		status = interface->get_u8(value, cap, interface);
	return status;
}

static acpi_status set_u8(uint8_t value, uint8_t min, uint8_t max, uint32_t cap) {
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
	DEBUG(1, "Commandline args: mailled(%d) wireless(%d) bluetooth(%d) brightness(%d)\n",
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
 * FIXME - sysfs interface
 */

#define show_set_bool(value, cap)					\
static ssize_t								\
show_bool_##value(struct device *dev, struct device_attribute *attr,	\
	char *buf)	\
{									\
	bool result;							\
	acpi_status status = get_bool(&result, cap);			\
	if (ACPI_SUCCESS(status))					\
		return sprintf(buf, "%d\n", result);			\
	return sprintf(buf, "Read error" );				\
}									\
									\
static ssize_t								\
set_bool_##value(struct device *dev, struct device_attribute *attr,	\
	const char *buf,						\
	size_t count)							\
{									\
	bool tmp = simple_strtoul(buf, NULL, 10);			\
	acpi_status status = set_bool(tmp, cap); 			\
		if (ACPI_FAILURE(status))				\
			return -EINVAL;					\
   	return count;							\
}									\
static DEVICE_ATTR(value, S_IWUGO | S_IRUGO | S_IWUSR, 			\
	show_bool_##value, set_bool_##value);

show_set_bool(wireless, ACER_CAP_WIRELESS);
show_set_bool(bluetooth, ACER_CAP_BLUETOOTH);
#ifdef EXPERIMENTAL_INTERFACES
show_set_bool(threeg, ACER_CAP_THREEG);
#endif
show_set_bool(mailled, ACER_CAP_MAILLED);

#define show_set_u8(value, cap)						\
static ssize_t								\
show_u8_##value(struct device *dev, struct device_attribute *attr, 	\
	char *buf)							\
{									\
        uint8_t result;							\
	acpi_status status = get_u8(&result, cap);			\
	if (ACPI_SUCCESS(status))					\
		return sprintf(buf, "%u\n", result);			\
	return sprintf(buf, "Read error" );				\
}									\
									\
static ssize_t								\
set_u8_##value(struct device *dev, struct device_attribute *attr,	\
	const char *buf,						\
	size_t count)							\
{									\
	int tmp = simple_strtoul(buf, NULL, 10);			\
	acpi_status status = (*set_##value)(tmp);			\
		if (ACPI_FAILURE(status))				\
			return -EINVAL;					\
	return count;							\
}									\
static DEVICE_ATTR(value, S_IWUGO | S_IRUGO | S_IWUSR, show_u8_##value,	\
	set_u8_##value);

show_set_u8(brightness, ACER_CAP_BRIGHTNESS);

/*
 * Platform device
 */

static struct platform_driver acer_platform_driver = {
	.driver = {
		.name = "acer-laptop",
		.owner = THIS_MODULE,
		}
};

static struct platform_device *acer_platform_device;

static int remove_sysfs(struct platform_device *device)
{
	device_remove_file(&device->dev, &dev_attr_wireless);
	device_remove_file(&device->dev, &dev_attr_bluetooth);
	device_remove_file(&device->dev, &dev_attr_mailled);
#ifdef EXPERIMENTAL_INTERFACES
	device_remove_file(&device->dev, &dev_attr_threeg);
#endif
	device_remove_file(&device->dev, &dev_attr_brightness);
	return 0;
}

static int acer_platform_add(void)
{
	int retval = -ENOMEM;
	platform_driver_register(&acer_platform_driver);

	acer_platform_device = platform_device_alloc("acer-laptop", -1);

	platform_device_add(acer_platform_device);

	retval = device_create_file(&acer_platform_device->dev, &dev_attr_wireless);
	if (retval)
		goto error;
	retval = device_create_file(&acer_platform_device->dev, &dev_attr_bluetooth);
	if (retval)
		goto error;
	retval = device_create_file(&acer_platform_device->dev, &dev_attr_mailled);
	if (retval)
		goto error;
#ifdef EXPERIMENTAL_INTERFACES
	retval = device_create_file(&acer_platform_device->dev, &dev_attr_threeg);
	if (retval)
		goto error;
#endif
	retval = device_create_file(&acer_platform_device->dev, &dev_attr_brightness);
	if (retval)
		goto error;
	
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

static int acer_acpi_add(struct acpi_device *device)
{
	acer_platform_add();
	return 0;
}

static int acer_acpi_remove(struct acpi_device *device, int type)
{
	acer_platform_remove();
	return 0;
}

static int acer_acpi_resume(struct acpi_device *device)
{
	/* AMW0 fix - reset all devices, otherwise we have meaningless values */
	interface->init(interface);
	return 0;
}

static struct acpi_driver acer_acpi_driver = {
	.name = "acer_acpi",
	.class = "acer",
	.ids = "PNP0C14",
	.ops = {
		.add = acer_acpi_add,
		.remove = acer_acpi_remove,
		.resume = acer_acpi_resume,
		},
};

static int __init acer_acpi_init(void)
{
	acpi_status status = AE_OK;

	printk(MY_INFO "Acer Laptop ACPI Extras version %s\n",
			ACER_ACPI_VERSION);
	if (acpi_disabled) {
		printk(MY_ERR "ACPI Disabled, unable to load.\n");
		return -ENODEV;
	}

	/*
	 * Detect which WMI interface we're using.
	 *
	 * TODO: This could be more dynamic, and perhaps done in part by the
	 *       acpi_bus driver?
	 */
	if (is_valid_acpi_path(AMW0_METHOD)) {
		DEBUG(0, "Detected ACER AMW0 interface\n");
		interface = &AMW0_interface;
		/* .ids is case sensitive - and AMW0 uses a spec-breaking case */
		acer_acpi_driver.ids = "pnp0c14";
	} else if (is_valid_acpi_path(WMID_METHOD)) {
		DEBUG(0, "Detected ACER WMID interface\n");
		interface = &WMID_interface;
	} else {
		printk(MY_ERR "No or unsupported WMI interface, unable to load.\n");
		goto error_no_interface;
	}

	/* Now that we have a known interface, initialize it */
	if (interface->init) {
		status = interface->init(interface);
		if (ACPI_FAILURE(status)) {
			printk(MY_ERR "Interface initialization failed.\n");
			goto error_interface_init;
		}
	}

	/*
	 * Register the driver
	 *
	 * TODO: Can we use the bus detection code to check for the interface
	 *       or all or part of the method ID path?
	 */
	status = acpi_bus_register_driver(&acer_acpi_driver);
	if (ACPI_FAILURE(status)) {
		printk(MY_ERR "Unable to register driver, aborting.\n");
		goto error_acpi_bus_register;
	}
	printk(MY_INFO "Driver registered.\n");

	/* Finally, override any initial settings with values from the commandline */
	acpi_commandline_init();

	return status;

error_acpi_bus_register: /* FIXME */
error_interface_init:
error_no_interface:
	return -ENODEV;
}

static void __exit acer_acpi_exit(void)
{
	acpi_bus_unregister_driver(&acer_acpi_driver);

	if (interface->free)
		interface->free(interface);

	printk(MY_INFO "Acer Laptop ACPI Extras unloaded\n");
	return;
}

module_init(acer_acpi_init);
module_exit(acer_acpi_exit);
