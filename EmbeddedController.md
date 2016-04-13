# Introduction #

The Embedded Controller (EC) is an interface to the lower level hardware on laptops. For the most part, acer\_acpi has never touched this, as ACPI-WMI has abstracted most of this away.

However, on quite a few laptops, it is now clear that to access certain devices, we are going to have to deal directly with the EC (especially on AMW0 laptops, where we have no way of knowing the true status of wireless, bluetooth and the mail LED without accessing the EC directly). The problem is that how the EC is wired varies from model to model, forcing us to find out about the EC on as many models as we can.

# Read first #

If you have a laptop that is:

  * listed in SupportedHardware as type 2/ 3 (WMID or AMW0 v2) -> The only information we may need for your laptop is how to control the mail LED. WMI exposes everything else, so I don't need you to work out what EC registers correspond to the status of the other devices.

  * listed in SupportedHardware as type 1 (AMW0) -> You should only need to touch this script if acer\_acpi can't read the status of your wireless, bluetooth backlight and mail LED properly.

  * not listed in SupportedHardware - Please send me your DSDT

  * listed as unsupported in SupportedHardware - I won't add EC quirks to acer\_acpi for your laptop. EC quirks are meant in acer\_acpi to act as a compliment for the bits that WMI doesn't expose to us, and I don't want to end up with maintaining a large set of different EC quirks for all manner of Acer laptops out there, which I consider out-of-scope for acer\_acpi.

# Tools #

[acer\_ec.pl](http://aceracpi.googlecode.com/svn/trunk/acer_ec/acer_ec.pl)

acer\_ec.pl is a Perl script which can dump the values of all the EC's registers. To do this, run (as root, as you need to access /dev/port):

perl acer\_ec.pl regs

This will output all the EC registers and their current values on your laptop. To get the name of a register, you will need to combine the column and row names -

e.g. the register at row B0 and column 0A is register 0xBA (0x is used to indicate this is a hexadecimal number).

**NOTE:** acer\_ec.pl is not guaranteed to run properly, and can easily lock up your system (we know of a few laptops so far where this happens). Please do not report bugs for these, as there is not much we can do about it.

# Embedded Controller #

The Embedded Controller (EC) has 255 registers (0x00 to 0xFF). All EC registers are 8 bit, and we read their contents as unsigned decimal values from 0 to 255.

Unfortunately, the meaning and contents of these registers varies on each model (let alone whether the laptop is AMW0 or WMID) so it is not possible for us to apply the knowledge from one laptop on all the others.

# AMW0 Laptops #

If any of the values read from wireless, bluetooth or the mail LED are wrong, or the brightness control doesn't work, then you will need to look at the registers of the EC on your laptop to find the right ones.

## Brightness ##

This is the easiest to spot.

Turn the brightness up to maximum, and look at the EC register values. One of them should be 15. Turn the brightness down, and and the register will change to 14 (and so on). If you turn the brightness all the way down, the register will show 0.

## Mail LED, Bluetooth and Wireless ##

On the Aspire 5020, the status of these is all stored in one EC register - 0x0A. To extract a particular one, we can just apply a bitmask.

So, for instance, on the Aspire 5020, depending on what we toggle, these values are in EC register 0x0A:

  * Bluetooth Off, Wireless Off, Mail LED off: 0
  * Bluetooth Off, Wireless On, Mail LED off: 4 (bit 4 toggled)
  * Bluetooth Off, Wireless Off, Mail LED on: 128 (bit 8 toggled)
  * Bluetooth Off, Wireless On, Mail LED on: 132 (bits 4 & 8 toggled)
  * Bluetooth On, Wireless Off, Mail LED off: 16 (bit 5 toggled)

The easiest way to test this is to turn on/ off wireless, bluetooth and the mail LED one at a time, and compare the registers before and after - try looking for just _one_ register that changes consistently when you do this.

# WMID laptops #

Coming soon:

Mail LED

(I don't have this hardware, so can't offer much guidance. On the TravelMate 2490, the status can be read from EC register 0x9F - you can try this on your laptop by using "force\_series=2490").

# What I Need From You #

If you manage to find something, please report back to me (Carlos - carlos(@)strangeworlds.co.uk):

1) Please check the 'Read me' section first to see if I actually do need anything from you.

1) Whatever you have discovered (e.g. brightness is controlled through EC register 0x83, or wireless status is stored in register 0x0A, 'on' is value X, 'off' is value Y)

2) The output of:

```
dmidecode --string system-manufacturer
dmidecode --string system-product-name
```