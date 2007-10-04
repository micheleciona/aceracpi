/*
 *  wmi.h
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

/* Workaround needed for older kernels */
#ifndef bool
#define bool int
#endif

acpi_status wmi_evaluate_method(const char *guid, u32 instance, u32 method_id, const struct acpi_buffer *in, struct acpi_buffer *out);
acpi_status wmi_query_block(const char *guid, u32 instance, u32 method_id, struct acpi_buffer *out);
acpi_status wmi_set_block(const char *guid, u32 instance, u32 method_id, const struct acpi_buffer *in);

bool wmi_has_guid(char *guid);
