/*
 *  acer_acpi.c - Acer Laptop ACPI Extras
 *
 *
 *  Copyright (C) 2005-2007	E.M. Smith
 *  Copyright (C) 2007		Carlos Corbacho <cathectic@gmail.com>
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
 *                driver problem for my Aspire 5024.
 *  Mathieu Segaud - solved the ACPI problem that needed a double-modprobe
 *                   in version 0.2 and below.
 *  Carlos Corbacho - added initial status support for wireless/ mail/
 *                    bluetooth, added module parameter support to turn
 *                    hardware/ LEDs on and off at module loading (thanks
 *                    again to acerhk for the inspiration)
 *  Jim Ramsay - Figured out and added support for WMID interface
 *
 */

#define ACER_ACPI_VERSION	"0.8"
#define PROC_INTERFACE_VERSION	1
#define PROC_ACER		"acer"

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/types.h>
#include <linux/proc_fs.h>
#include <linux/delay.h>
#include <linux/uaccess.h>
#include <linux/preempt.h>
#include <linux/io.h>
#include <linux/dmi.h>
#include <linux/backlight.h>

#include <acpi/acpi_drivers.h>

MODULE_AUTHOR("Mark Smith");
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
 * Brightness values range from 0x0 to 0xf, inclusive.
 */
#define ACER_MAX_BRIGHTNESS 0xF

/*
 * The maximum temperature one can set for fan control override.
 * Doesn't propably make much sense if over 80 degrees celsius though...
 */
#define ACER_MAX_TEMPERATURE_OVERRIDE 150

/*
 * The following defines quirks to get some specific functions to work
 * which are known to not be supported over ACPI (such as the mail LED
 * on WMID based Acer's)
 */
struct acer_quirks {
	const char *vendor, *model;
	u16 quirks;
};

/*
 * Keyboard controller ports
 */
#define ACER_KBD_STATUS_REG	0x64	/* Status register (R) */
#define ACER_KBD_CNTL_REG	0x64	/* Controller command register (W) */
#define ACER_KBD_DATA_REG	0x60	/* Keyboard data register (R/W) */

/*
 * Magic Number
 * Meaning is unknown - this number is required for writing to ACPI for AMW0
 * (it's also used in acerhk when directly accessing the EC)
 */
#define ACER_AMW0_WRITE	0x9610

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
#define ACER_CAP_TOUCHPAD_READ	(1<<5)
#define ACER_CAP_TEMPERATURE_OVERRIDE	(1<<6)
#define ACER_CAP_ANY        (0xffffffff)

/*
 * Interface type flags
 */
#define ACER_AMW0 (1<<0)
#define ACER_WMID (1<<1)

/*
 * Presumed start states -
 * On some AMW0 laptops, we do not yet know how to get the device status from
 * the EC, so we must store this ourselves.
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
static int fan_temperature_override = -1;
static int debug = 0;
static int force_series;

module_param(mailled, int, 0444);
module_param(wireless, int, 0444);
module_param(bluetooth, int, 0444);
module_param(brightness, int, 0444);
module_param(threeg, int, 0444);
module_param(force_series, int, 0444);
module_param(fan_temperature_override, int, 0444);
module_param(debug, int, 0664);
MODULE_PARM_DESC(wireless, "Set initial state of Wireless hardware");
MODULE_PARM_DESC(bluetooth, "Set initial state of Bluetooth hardware");
MODULE_PARM_DESC(mailled, "Set initial state of Mail LED");
MODULE_PARM_DESC(brightness, "Set initial LCD backlight brightness");
MODULE_PARM_DESC(threeg, "Set initial state of 3G hardware");
MODULE_PARM_DESC(fan_temperature_override, "Set initial state of the 'FAN temperature-override'");
MODULE_PARM_DESC(debug, "Debugging verbosity level (0=least 2=most)");
MODULE_PARM_DESC(force_series, "Force a different laptop series for extra features (5020 or 2490)");

struct ProcItem {
	const char *name;
	char *(*read_func) (char *, uint32_t);
	unsigned long (*write_func) (const char *, unsigned long, uint32_t);
	unsigned int capability;
};

static struct proc_dir_entry *acer_proc_dir;

static int is_valid_acpi_path(const char *methodName)
{
	acpi_handle handle;
	acpi_status status;

	status = acpi_get_handle(NULL, (char *)methodName, &handle);
	return ACPI_SUCCESS(status);
}

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

static void send_kbd_cmd(uint8_t cmd, uint8_t val)
{
	preempt_disable();
	if (!wait_kbd_write())
		outb(cmd, ACER_KBD_CNTL_REG);
	if (!wait_kbd_write())
		outb(val, ACER_KBD_DATA_REG);
	preempt_enable_no_resched();
}

static void set_keyboard_quirk(void)
{
	send_kbd_cmd(0x59, 0x90);
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
	void (*init) (struct Interface*);

	/*
	 * Frees an interface, should free the interface-specific data
	 */
	void (*free) (struct Interface*);

	/*
	 * Gets and sets various data types.
	 *   First paramater:  Value to set, or pointer to place got value into
	 *   Second parameter: Specific capability being requested
	 *   Third paramater: Pointer to this interface
	 */
	acpi_status (*get_bool) (bool*, uint32_t, struct Interface*);
	acpi_status (*set_bool) (bool, uint32_t, struct Interface*);
	acpi_status (*get_u8) (uint8_t*, uint32_t, struct Interface*);
	acpi_status (*set_u8) (uint8_t, uint32_t, struct Interface*);

	/*
	 * Interface-specific private data member.  Must *not* be touched by
	 * anyone outside of this struct
	 */
	void *data;
};

/* The static interface pointer, points to the currently detected interface */
static struct Interface *interface;

/*
 * Embedded Controller quirks
 * Some laptops require us to directly access the EC to either enable or query
 * features that are not available through ACPI.
 */

struct quirk_entry {
	int wireless;
	int mailled;
	int brightness;
	int touchpad;
	int temperature_override;
	int mmkeys;
};

static struct quirk_entry *quirks;

static void set_quirks(void)
{
	if (quirks->mailled) {
		interface->capability |= ACER_CAP_MAILLED;
		DEBUG(1, "Using EC direct-access quirk for mail LED\n");
	}

	if (quirks->touchpad) {
		interface->capability |= ACER_CAP_TOUCHPAD_READ;
		DEBUG(1, "Using EC direct-access quirk for reading touchpad status\n");
	}

	if (quirks->temperature_override) {
		interface->capability |= ACER_CAP_TEMPERATURE_OVERRIDE;
		DEBUG(1, "Using EC direct-access quirk for temperature override setting (fan)\n");
	}

	if (quirks->brightness) {
		interface->capability |= ACER_CAP_BRIGHTNESS;
		DEBUG(1, "Using EC direct-access quirk for backlight brightness\n");
	}

	if (quirks->mmkeys) {
		set_keyboard_quirk();
		printk(MY_INFO "Setting keyboard quirk to enable multimedia keys\n");
	}
}

static int dmi_matched(struct dmi_system_id *dmi)
{
	quirks = dmi->driver_data;
	return 0;
}

static struct quirk_entry quirk_unknown = {
};

static struct quirk_entry quirk_acer_aspire_5020 = {
	.wireless = 1,
	.mailled = 2,
	.brightness = 1,
	.temperature_override = 1,
};

static struct quirk_entry quirk_acer_aspire_5680 = {
	.mmkeys = 1,
};

static struct quirk_entry quirk_acer_travelmate_2490 = {
	.mmkeys = 1,
	.mailled = 1,
	.temperature_override = 1,
	.touchpad = 1,
};

static struct dmi_system_id acer_quirks[] = {
	{
		.callback = dmi_matched,
		.ident = "Acer Aspire 5020",
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5020"),
		},
		.driver_data = &quirk_acer_aspire_5020,
	},
	{
		.callback = dmi_matched,
		.ident = "Acer Aspire 5680",
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5680"),
		},
		.driver_data = &quirk_acer_aspire_5680,
	},
	{
		.callback = dmi_matched,
		.ident = "Acer TravelMate 2490",
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 2490"),
		},
		.driver_data = &quirk_acer_travelmate_2490,
	},
	{}
};

/* Find which quirks are needed for a particular vendor/ model pair */
static void find_quirks(void)
{
	DEBUG (1, "Looking for quirks\n");
	if (!force_series) {
		dmi_check_system(acer_quirks);
	} else if (force_series == 5020) {
		DEBUG(0, "Forcing Acer Aspire 5020\n");
		quirks = &quirk_acer_aspire_5020;
	} else if (force_series == 2490) {
		DEBUG(0, "Forcing Acer TravelMate 2490\n");
		quirks = &quirk_acer_travelmate_2490;
	}

	if (quirks == NULL) {
		DEBUG(1, "No quirks known for this laptop\n");
		quirks = &quirk_unknown;
	}
	set_quirks();
}

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
static acpi_status get_bool_via_u8(bool *value, uint32_t cap, struct Interface *iface) {
	acpi_status status;
	uint8_t result;

	status = iface->get_u8(&result, cap, iface);

	if (ACPI_SUCCESS(status))
		*value = (result != 0);

	return status;
}

static acpi_status set_bool_via_u8(bool value, uint32_t cap, struct Interface *iface) {
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

static acpi_status WMAB_execute(struct WMAB_args * regbuf, struct acpi_buffer *result)
{
	struct acpi_buffer input;
	acpi_status status;
	input.length = sizeof(struct WMAB_args);
	input.pointer = (u8*)regbuf;

	status = WMI_execute( AMW0_METHOD, 1, &input, result);
	DEBUG(2, "  Args: 0x%08x 0x%08x 0x%08x 0x%08x\n", regbuf->eax, regbuf->ebx, regbuf->ecx, regbuf->edx );

	return status;
}

static void AMW0_init(struct Interface *iface) {
	struct AMW0_Data *data;

	/* Allocate our private data structure */
	iface->data = kmalloc(sizeof(struct AMW0_Data), GFP_KERNEL);
	data = (struct AMW0_Data*)iface->data;

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
	data->bluetooth = -1;

	if (!quirks->wireless)
		data->wireless = -1;
	if (!quirks->mailled)
		data->mailled = -1;
}

static acpi_status AMW0_get_bool(bool *value, uint32_t cap, struct Interface *iface)
{
	struct AMW0_Data *data = iface->data;
	uint8_t result;

	/*
	 * On some models, we can read these values from the EC. On others,
	 * we use a stored value
         */
	switch (cap) {
	case ACER_CAP_MAILLED:
		if (quirks->mailled == 2) {
			ec_read(0x0A, &result);
			*value = (result >> 7) & 0x01;
			return 0;
		}
		else
			*value = data->mailled;
		break;
	case ACER_CAP_WIRELESS:
		if (quirks->wireless == 1) {
			ec_read(0x0A, &result);
			*value = (result >> 2) & 0x01;
			return 0;
		}
		else
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

static acpi_status AMW0_set_bool(bool value, uint32_t cap, struct Interface *iface)
{
	struct WMAB_args args;
	acpi_status status;

	args.eax = ACER_AMW0_WRITE;
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

static acpi_status AMW0_get_u8(uint8_t *value, uint32_t cap, struct Interface *iface) {
	switch (cap) {
	case ACER_CAP_BRIGHTNESS:
		if (quirks->brightness == 1) {
			ec_read(0x83, value);
		}
		break;
	default:
		return AE_BAD_ADDRESS;
	}
	return AE_OK;
}

static acpi_status AMW0_set_u8(uint8_t value, uint32_t cap, struct Interface *iface) {
	switch (cap) {
	case ACER_CAP_BRIGHTNESS:
		if (quirks->brightness == 1) {
			ec_write(0x83, value);
		}
		break;
	default:
		return AE_BAD_ADDRESS;
	}
	return AE_OK;
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
	.get_u8 = AMW0_get_u8,
	.set_u8 = AMW0_set_u8,
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
	data = (struct WMID_Data*)iface->data;
}

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

static acpi_status WMID_get_u8(uint8_t *value, uint32_t cap, struct Interface *iface) {
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
	case ACER_CAP_MAILLED:
		if (quirks->mailled == 1) {
			ec_read(0x9f, value);
			*value &= 0x01;
			return 0;
		}
	case ACER_CAP_TOUCHPAD_READ:
		if (quirks->touchpad == 1) {
			ec_read(0x9e, value);
			*value = 1 - ((*value >> 3) & 0x01);
			return 0;
		}
	case ACER_CAP_TEMPERATURE_OVERRIDE:
		if (quirks->temperature_override == 1) {
			ec_read(0xa9, value);
			return 0;
		}
	default:
		return AE_BAD_ADDRESS;
	}
	status = WMI_execute_uint32(methodId, 0, &result);

	if (ACPI_SUCCESS(status))
		*value = (uint8_t)result;

	return status;
}

static acpi_status WMID_set_u8(uint8_t value, uint32_t cap, struct Interface *iface) {
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
	case ACER_CAP_MAILLED:
		if (quirks->mailled == 1) {
			send_kbd_cmd(0x59, value ? 0x92 : 0x93);
			return 0;
		}
	case ACER_CAP_TEMPERATURE_OVERRIDE:
		if (quirks->temperature_override == 1) {
			ec_write(0xa9, value);
			return 0;
		}
	default:
		return AE_BAD_ADDRESS;
	}
	return WMI_execute_uint32(methodId, (uint32_t)value, NULL);
}


static struct Interface WMID_interface = {
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
	.data = NULL,
};

/*
 * High-level Procfs file handlers 
 */

static int
dispatch_read(char *page, char **start, off_t off, int count, int *eof,
	      struct ProcItem * item)
{
	char *p = page;
	int len;

	if (off == 0)
		p = item->read_func(p, item->capability);
	len = (p - page);
	if (len <= off + count)
		*eof = 1;
	*start = page + off;
	len -= off;
	if (len > count)
		len = count;
	if (len < 0)
		len = 0;
	return len;
}

static int
dispatch_write(struct file *file, const char __user * buffer,
	       unsigned long count, struct ProcItem * item)
{
	int result;
	char *tmp_buffer;

	/*
	 * Arg buffer points to userspace memory, which can't be accessed
	 * directly.  Since we're making a copy, zero-terminate the
	 * destination so that sscanf can be used on it safely. 
	 */
	tmp_buffer = kmalloc(count + 1, GFP_KERNEL);
	if (copy_from_user(tmp_buffer, buffer, count)) {
		result = -EFAULT;
	} else {
		tmp_buffer[count] = 0;
		result = item->write_func(tmp_buffer, count, item->capability);
	}
	kfree(tmp_buffer);
	return result;
}

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

static acpi_status set_temperature_override(uint8_t value)
{
	return set_u8(value, 0, ACER_MAX_TEMPERATURE_OVERRIDE, ACER_CAP_TEMPERATURE_OVERRIDE);
}

static void __init acpi_commandline_init(void)
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
	set_temperature_override(fan_temperature_override);
	set_brightness((uint8_t)brightness);
}

/*
 * Procfs interface
 */
static char *read_bool(char *p, uint32_t cap)
{
	bool result;
	acpi_status status = get_bool(&result, cap);
	if (ACPI_SUCCESS(status))
		p += sprintf(p, "%d\n", result);
	else
		p += sprintf(p, "Read error" );
	return p;
}

static unsigned long write_bool(const char *buffer, unsigned long count, uint32_t cap)
{
	int value;

	/*
	 * For now, we are still supporting the "enabled: %i" - this _will_ be deprecated in 0.7
	 */
	if ((sscanf(buffer, " enabled : %i", &value) == 1
				|| sscanf(buffer, "%i", &value) == 1)) {
		acpi_status status = set_bool(value, cap);
		if (ACPI_FAILURE(status))
			return -EINVAL;
	} else {
		return -EINVAL;
	}
	return count;
}

static char *read_u8(char *p, uint32_t cap)
{
	uint8_t result;
	acpi_status status = get_u8(&result, cap);
	if (ACPI_SUCCESS(status))
		p += sprintf(p, "%u\n", result);
	else
		p += sprintf(p, "Read error" );
	return p;
}

static unsigned long write_u8(const char *buffer, unsigned long count, uint32_t cap)
{
	int value;
	acpi_status (*set_method)(uint8_t);

	/* Choose the appropriate set_u8 wrapper here, based on the capability */
	switch (cap) {
	case ACER_CAP_BRIGHTNESS:
		set_method = set_brightness;
		break;
	case ACER_CAP_TEMPERATURE_OVERRIDE:
		set_method = set_temperature_override;
		break;
	default:
		return -EINVAL;
	};

	if (sscanf(buffer, "%i", &value) == 1) {
		acpi_status status = (*set_method)(value);
		if (ACPI_FAILURE(status))
			return -EINVAL;
	} else {
		return -EINVAL;
	}
	return count;
}

static char *read_version(char *p, uint32_t cap)
{
	p += sprintf(p, "driver:                  %s\n", ACER_ACPI_VERSION);
	p += sprintf(p, "proc_interface:          %d\n",
			PROC_INTERFACE_VERSION);
	return p;
}

static char *read_interface(char *p, uint32_t cap)
{
	p += sprintf(p, "interface:               %s\n", (interface->type == ACER_AMW0 ) ? "AMW0": "WMID");
	return p;
}

struct ProcItem proc_items[] = {
	{"mailled", read_bool, write_bool, ACER_CAP_MAILLED},
	{"bluetooth", read_bool, write_bool, ACER_CAP_BLUETOOTH},
	{"wireless", read_bool, write_bool, ACER_CAP_WIRELESS},
	{"brightness", read_u8, write_u8, ACER_CAP_BRIGHTNESS},
	{"threeg", read_bool, write_bool, ACER_CAP_THREEG},
	{"touchpad", read_bool, NULL, ACER_CAP_TOUCHPAD_READ},
	{"fan_temperature_override", read_u8, write_u8, ACER_CAP_TEMPERATURE_OVERRIDE},
	{"version", read_version, NULL, ACER_CAP_ANY},
	{"interface", read_interface, NULL, ACER_CAP_ANY},
	{NULL}
};

static acpi_status __init add_proc_entries(void)
{
	struct proc_dir_entry *proc;
	struct ProcItem *item;

	for (item = proc_items; item->name; ++item) {
		/* 
		 * Only add the proc file if the current interface actually
		 * supports it
		 */
		if (interface->capability & item->capability) {
			proc = create_proc_read_entry(item->name,
					S_IFREG | S_IRUGO | S_IWUSR,
					acer_proc_dir,
					(read_proc_t *) dispatch_read,
					item);
			if (proc)
				proc->owner = THIS_MODULE;
			if (proc && item->write_func)
				proc->write_proc = (write_proc_t *) dispatch_write;
		}
	}

	return AE_OK;
}

static acpi_status __exit remove_proc_entries(void)
{
	struct ProcItem *item;

	for (item = proc_items; item->name; ++item)
		remove_proc_entry(item->name, acer_proc_dir);
	return AE_OK;
}

/*
 * Backlight device
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
		printk(MY_ERR
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
 * ACPI driver
 */
static int acer_acpi_suspend(struct acpi_device *device, pm_message_t state)
{
	/* 
	 * WMID fix for suspend-to-disk - save all current states now so we can
	 * restore them on resume
	 */
	bool value;
	uint8_t u8value;

	#define save_bool_device(device, cap) \
	if (has_cap(cap)) {\
		get_bool(&value, cap);\
		data->device = value;\
	}

	#define save_u8_device(device, cap) \
	if (has_cap(cap)) {\
		get_u8(&u8value, cap);\
		data->device = u8value;\
	}
	
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
	if (has_cap(cap))\
		set_bool(data->device, cap);\

	/*
	 * We must _always_ restore AMW0's values, otherwise the values
	 * after suspend-to-disk are wrong
	 */
	if (interface->type == ACER_AMW0) {
		struct AMW0_Data *data = interface->data;
	
		restore_bool_device(wireless, ACER_CAP_WIRELESS);
		restore_bool_device(bluetooth, ACER_CAP_BLUETOOTH);
		restore_bool_device(mailled, ACER_CAP_MAILLED);
	}
	else if (interface->type == ACER_WMID) {
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
	if (quirks->mmkeys) {
		set_keyboard_quirk();
		printk(MY_INFO "Setting keyboard quirk to enable multimedia keys\n");
	}

	return 0;
}

static int acer_acpi_add(struct acpi_device *device)
{
	struct device *dev = acpi_get_physical_device(device->handle);
	if (has_cap(ACER_CAP_BRIGHTNESS))
		acer_backlight_init(dev);
	return 0;
}

static int acer_acpi_remove(struct acpi_device *device, int type)
{
	if (has_cap(ACER_CAP_BRIGHTNESS))
		acer_backlight_exit();
	return 0;
}

static struct acpi_driver acer = {
	.name = "acer_acpi",
	.class = "acer",
	.ids = "pnp0c14",
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
		DEBUG(0, "Detected Acer AMW0 interface\n");
		/* .ids is case sensitive - and AMW0 uses a strange mixed case */
		acer.ids = "pnp0c14";
		interface = &AMW0_interface;
	} else if (is_valid_acpi_path(WMID_METHOD)) {
		DEBUG(0, "Detected Acer WMID interface\n");
		interface = &WMID_interface;
	} else {
		printk(MY_ERR "No or unsupported WMI interface, unable to load.\n");
		goto error_no_interface;
	}

	/* Find if this laptop requires any quirks */
	DEBUG(1, "Finding quirks\n");
	find_quirks();

	/* Now that we have a known interface, initialize it */
	DEBUG(1, "Initialising interface\n");
	if (interface->init)
		interface->init(interface);

	/* Create the proc entries */
	acer_proc_dir = proc_mkdir(PROC_ACER, acpi_root_dir);
	if (!acer_proc_dir) {
		printk(MY_ERR "Unable to create /proc entries, aborting.\n");
		goto error_proc_mkdir;
	}

	acer_proc_dir->owner = THIS_MODULE;
	status = add_proc_entries();
	if (status) {
		printk(MY_ERR "Unable to create /proc entries, aborting.\n");
		goto error_proc_add;
	}

	/*
	 * Register the driver
	 *
	 * TODO: Can we use the bus detection code to check for the interface
	 *       or all or part of the method ID path?
	 */
	status = acpi_bus_register_driver(&acer);
	printk(MY_INFO "Driver registered\n");
	if (status) {
		printk(MY_ERR "Unable to register driver, aborting.\n");
		goto error_acpi_bus_register;
	}

	/* Override any initial settings with values from the commandline */
	acpi_commandline_init();

	return 0;

error_acpi_bus_register:
	remove_proc_entries();
error_proc_add:
	if (acer_proc_dir)
		remove_proc_entry(PROC_ACER, acpi_root_dir);
error_proc_mkdir:
	if (interface->free)
		interface->free(interface);
error_no_interface:
	return -ENODEV;
}

static void __exit acer_acpi_exit(void)
{
	acpi_bus_unregister_driver(&acer);

	remove_proc_entries();

	if (acer_proc_dir)
		remove_proc_entry(PROC_ACER, acpi_root_dir);

	if (interface->free)
		interface->free(interface);

	printk(MY_INFO "Acer Laptop ACPI Extras unloaded\n");
	return;
}

module_init(acer_acpi_init);
module_exit(acer_acpi_exit);
