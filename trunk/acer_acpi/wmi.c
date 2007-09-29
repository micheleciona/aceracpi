/*
 *  wmi.c - WMI ACPI interface device
 *
 *  Copyright (C) 2007 Carlos Corbacho <cathectic@gmail.com>
 *
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or (at
 *  your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful, but
 *  WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
 *
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/types.h>
#include <acpi/acpi_drivers.h>
#include <linux/version.h>

#include "wmi.h"

#define ACPI_WMI_CLASS			"wmi"

#define MY_LOGPREFIX "wmi: "
#define MY_ERR KERN_ERR MY_LOGPREFIX
#define MY_NOTICE KERN_NOTICE MY_LOGPREFIX
#define MY_INFO KERN_INFO MY_LOGPREFIX

#define DEBUG(level, message...) { \
	if (debug >= level) \
		printk(KERN_DEBUG MY_LOGPREFIX message);\
}

MODULE_AUTHOR("Carlos Corbacho");
MODULE_DESCRIPTION("ACPI WMI Interface Driver");
MODULE_LICENSE("GPL");

struct guid_mapping
{
	char guid[16];
	char object_id[2];
	u8 instance_count;
	u8 flags;
};

static struct guid_mapping *guid_list = NULL;
static acpi_handle acpi_wmi_handle;
static int debug;

module_param(debug, int, 0664);
MODULE_PARM_DESC(debug, "Debugging verbosity level (0=least 2=most)");

/*
 * Set this flag if the WCxx control method should be run to whenever the first
 * data consumer is interested in collecting the data block and whenever the last data
 * consumer is no longer interested.
 */
#define WMIACPI_REGFLAG_EXPENSIVE   0x1

/* Set this flag if the GUID represents a set of WMI method calls and not a data block */
#define WMIACPI_REGFLAG_METHOD      0x2

/*
 * Set this flag if the data block is wholly composed of a string and should be
 * translated from ASCIZ to UNICODE in returning queries and from UNICODE to ASCIZ
 * when passing sets
 */
#define WMIACPI_REGFLAG_STRING      0x04

/* Set this flag if the guid maps to an event rather than a data block or method */
#define WMIACPI_REGFLAG_EVENT       0x08

/**
 * wmi_parse_hexbyte - Convert a ASCII hex number to a byte
 * @src:  Pointer to at least 2 characters to convert.
 *
 * Convert a two character ASCII hex string to a number.
 *
 * Return:  0-255  Success, the byte was parsed correctly
 *          -1     Error, an invalid character was supplied
 */
static int wmi_parse_hexbyte (const u8 *src)
{
        unsigned int x;         /* For correct wrapping */
        int h;

        /* high part */
        if      ((x = src[0] - '0') <= '9'-'0') h = x;
        else if ((x = src[0] - 'a') <= 'f'-'a') h = x+10;
        else if ((x = src[0] - 'A') <= 'F'-'A') h = x+10;
        else return -1;
        h <<= 4;

        /* low part */
        if ((x = src[1] - '0') <= '9'-'0') return h | x;
        if ((x = src[1] - 'a') <= 'f'-'a') return h | (x+10);
        if ((x = src[1] - 'A') <= 'F'-'A') return h | (x+10);
        return -1;
}

/**
 * wmi_parse_guid - Convert GUID from ASCII to binary
 * @src:   36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
 * @dest:  Memory block to hold binary GUID (16 bytes)
 *
 * N.B. The GUID need not be NULL terminated.
 *
 * Return:  'true'   @dest contains binary GUID
 *          'false'  @dest contents are undefined
 */
static bool wmi_parse_guid (const u8 *src, u8 *dest)
{
        static const int size[] = { 4, 2, 2, 2, 6 };
        int i, j, v;

        if (src[8]  != '-' || src[13] != '-' ||
            src[18] != '-' || src[23] != '-')
                return false;

        for (j = 0; j < 5; j++, src++)
                for (i = 0; i < size[j]; i++, src+=2, *dest++ = v)
                        if ((v = wmi_parse_hexbyte (src)) < 0)
                                return false;

	DEBUG(2, "GUID succesfully parsed\n");

        return true;
}

#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,23)
const static struct acpi_device_id wmi_device_ids[] = {
	{"PNP0C14", 0},
	{"pnp0c14", 0},
	{"", 0},
};
MODULE_DEVICE_TABLE(acpi, wmi_device_ids);
#endif

static acpi_status wmi_evaluate_object(struct guid_mapping *block, u32 methodId, const struct acpi_buffer *in, struct acpi_buffer *out)
{
	struct acpi_object_list input;
	union acpi_object params[3];
	char method[4] = "";
	char method2[4] = "";

	if (block->flags & WMIACPI_REGFLAG_METHOD) {
		strcat(method, "WM");
	} else {
		/*
		 * We are now dealing with a data block - there are different
		 * methods for querying and setting these, so we must decide
		 * which one is to be called
		 */
		if (in == NULL) {
			strcat(method, "WQ");
		} else if (out == NULL) {
			strcat(method, "WS");
		} else {
			/* FIXME - problem, both in and out wanted for data block! */
		}
	}

	if (block->flags & WMIACPI_REGFLAG_STRING) {
		/* Convert input from Unicode to ASCIIZ */
		return AE_NOT_IMPLEMENTED;
	}

	input.count = 3;
	input.pointer = params;
	params[0].type = ACPI_TYPE_INTEGER;
	params[0].integer.value = 0x01;
	params[1].type = ACPI_TYPE_INTEGER;
	params[1].integer.value = methodId;

	if (in != NULL) { /* FIXME */
		params[2].type = ACPI_TYPE_BUFFER;
		params[2].buffer.length = in->length;
		params[2].buffer.pointer = in->pointer;
	}

	/* FIXME - arguments to pass? */
	if (block->flags & WMIACPI_REGFLAG_EXPENSIVE) {
		/*
		strcat(method2, "WC");
		strncat(method2, block->object_id, 2);
		acpi_evaluate_object(acpi_wmi_handle, method2, &input, out);	
		*/
		return AE_NOT_IMPLEMENTED;
	}

	strncat(method, block->object_id, 2);
	DEBUG(2, "Method to call is %s \n", method);

	return acpi_evaluate_object(acpi_wmi_handle, method, &input, out);
}

/*
 * Externally callable WMI functions
 */

int wmi_evaluate_block(char* guid, u32 methodId, const struct acpi_buffer *in, struct acpi_buffer *out)
{
	char block_guid[16];
	struct guid_mapping *block;

	DEBUG(2, "Passing GUID to parser\n");
	wmi_parse_guid(guid, &block_guid[0]);

	block = guid_list;

	while (block != NULL) {
		block++;
		if (memcmp(block->guid, block_guid, 16)) {
			if (block->flags & WMIACPI_REGFLAG_EVENT) {
				DEBUG(2, "GUID is an event\n");
				return AE_NOT_IMPLEMENTED;
			} else {
				DEBUG(2, "GUID is not an event - evaluating\n");
				return wmi_evaluate_object(block, methodId, in, out);
			}
		}
		return AE_BAD_ADDRESS;
	}

	DEBUG(2, "Unable to match GUID\n");
	return AE_BAD_ADDRESS;
}

EXPORT_SYMBOL(wmi_evaluate_block);

/*
 * Parse the _WDG method for the data blocks
 */
static int parse_wdg(void)
{
	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
	union acpi_object *obj;
	acpi_status status;

	status = acpi_evaluate_object(acpi_wmi_handle, "_WDG", NULL, &out);

	if (ACPI_FAILURE(status)) {
		DEBUG(2, "Problem with evaluating _WDG\n");
		return status;
	}

	obj = (union acpi_object*) out.pointer;

	if (obj->type != ACPI_TYPE_BUFFER) {
		DEBUG(2, "Output is not a buffer\n");
		return AE_ERROR;
	}

	DEBUG(2, "Size of _WDG output is %d bytes\n", obj->buffer.length);

	guid_list = (struct guid_mapping*) obj->buffer.pointer;

	DEBUG(2, "GUID blocks = %lu \n", obj->buffer.length / sizeof(struct guid_mapping));
	
	return AE_OK;
}

static int acpi_wmi_add(struct acpi_device *device)
{
	DEBUG(2, "acpi_wmi_add called\n");
	acpi_wmi_handle = device->handle;
	parse_wdg();

	return AE_OK;
}

static int acpi_wmi_remove(struct acpi_device *device, int type)
{	
	return AE_OK;
}

static struct acpi_driver acpi_wmi_driver = {
	.name = "wmi",
	.class = ACPI_WMI_CLASS,
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,23)
	.ids = wmi_device_ids,
#else
	.ids = "pnp0c14",
#endif
	.ops = {
		.add = acpi_wmi_add,
		.remove = acpi_wmi_remove,
		},
};

static int __init acpi_wmi_init(void)
{
	int result;

	if (acpi_disabled)
		return -ENODEV;

	result = acpi_bus_register_driver(&acpi_wmi_driver);

	#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,23)
	if (result < 0) {
		/* Try again with the alternate _HID */
		acpi_wmi_driver.ids = "PNP0C14";
		result = acpi_bus_register_driver(&acpi_wmi_driver);
	}
	#endif

	if (result < 0) {
		return -ENODEV;
	}

	printk("wmi: Succesfully loaded!\n");

	return 0;
}

static void __exit acpi_wmi_exit(void)
{
	acpi_bus_unregister_driver(&acpi_wmi_driver);
	printk("wmi: Unloaded!\n");

	return;
}

module_init(acpi_wmi_init);
module_exit(acpi_wmi_exit);
