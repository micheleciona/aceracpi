# FAQ #

## 1. What is acer\_acpi? ##

Jump to the [main page](http://code.google.com/p/aceracpi/) to find out.

## 2. What hardware is supported or unsupported? ##

See http://code.google.com/p/aceracpi/wiki/SupportedHardware (although the list is incomplete)

## 3. It doesn't work on supported hardware! I get "Unable to register driver, aborting!" ##

Please upgrade to the latest version of acer\_acpi. If that still doesn't work, please file a bug.

## 4. "Sorry, not yet implemented" or "Sorry, reading status not yet implemented" ##

Please upgrade to the latest version of acer\_acpi

## 5. dmesg tells me "No or unsupported WMI interface, unable to load" ##

Your laptop does not have the WMI-ACPI interface we use to control the hardware. There may be an alternative interface we don't know about - in order to find it, we'll need to do some disassembly of your ACPI DSDT.

## 6. "acer\_acpi: Unknown symbol led\_classdev\_unregister" ##

You need to enable the LED subsystem in your kernel configuration.

## 7. "acer\_acpi: Unknown symbol backlight\_device\_register " ##

You need to enable the backlight subsystem in your kernel configuration.

## 8. When is the next version of acer\_acpi coming out? ##

acer\_acpi is now deprecated. So unless there's a major bug fix required, there won't be one.


And finally, not a frequently-asked-question ...

## 9. Can I maintain a package for $LINUX\_DISTRO? ##

Please don't. acer-wmi is now available in mainline kernels, it would be better to just move to a newer kernel.

## 10. When will acer\_acpi go mainline? ##

acer-wmi, the upstream port of acer\_acpi, was merged into 2.6.25.

## 11. What will happen to acer\_acpi now? ##

acer\_acpi will now go into bug-fixing only mode, and be maintained exclusively for older kernels.

All development work will switch to the in-kernel acer-wmi instead.