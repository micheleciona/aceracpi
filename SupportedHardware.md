# Supported Hardware #
## Bluetooth ##

Bluetooth is an _optional_ device. Most of the supported laptop series can _support_ a bluetooth module, but many don't have one. So, just because you have a bluetooth button, doesn't mean you actually have a bluetooth module in your laptop.

Unfortunately, we can't detect this on acer\_acpi (on WMID, if you try to write to this, you'll get an error message in dmesg. On AMW0, this will just fail silently).

## WMID Users ##

### Mail LED ###

This is only supported on some WMID laptops by driving it through the Embedded Controller. To test this on another WMID laptop, load acer\_acpi with "force\_series=2490".

### 3G ###

Unless you have specifically bought a 3G model, you don't have this built in.

Acer lists such laptops twice - in the case of the Aspire 5680, there is the 'Aspire 5680-3G' and the 'Aspire 5680'.

Unless you have bought the -3G version of a laptop series, you don't have 3G (unfortunately, we can't tell them apart in acer\_acpi).

## Introduction ##

To summarise: the driver only supports those laptops that have an ACPI-WMI device (defined in your laptops DSDT). So, any laptop that doesn't provide this device is not supported.

acer\_acpi is not limited to just Acer laptops - we know at least one Fujitsu Siemens and one Medion laptop use the same ACPI-WMI interface as Acer.

Unfortunately, it is not possible to tell by the hardware alone which laptop series require acer\_acpi. The chances are, if you need to install LaunchManager or the Mobility Center add-on in Windows just to turn on your wireless, bluetooth, etc, then you probably need this driver.

If you discover your hardware is supported by acer\_acpi and it is not listed here, please send a dump of /sys/firmware/acpi/tables/DSDT to me (carlos(@)strangeworlds.co.uk), also listing the make and model of your laptop.

If your hardware is not listed on either supported or unsupported, and acer\_acpi does not load, please send me the dump of /sys/firmware/acpi/tables/DSDT (/proc/acpi/dsdt on older kernels) and the make and model anyway, as that way we can decide if acer\_acpi just needs tweaking to work on your hardware, or so we can definitely rule out your hardware as compatible.

If your hardware is listed as _not_ having a dump available, please send one - we are looking into any additional functionality that acer\_acpi can expose (which, at the moment, seems to be none).

All of our available DSDT dumps (translated to readable ASL) can be found in the [Subversion repository](http://aceracpi.googlecode.com/svn/trunk/dsdt/)

Legend:

  * u = Unconfirmed (Taken from the internet, please confirm if you have this model)
  * c = Confirmed (We have been told that this works, or confirmed that it doesn't)
  * d = DSDT available
  * dw = DSDT wanted (Please submit yours to us)
  * n = No WMI ACPI interface, will not support
  * r = New WMI ACPI interface, requires reverse engineering
  * k = Requires a keyboard quirk to enable multimedia keys
  * 1 = AMW0 interface
  * 2 = WMID interface
  * 3 = AMW0 v2 interface (AMW0 and WMID)
  * 4 = WMID v2 interface (new, UNSUPPORTED)

## Supported ##

This list is _very_ incomplete. These are only the models that have been reported back to us
as working - if your laptop works and is not on here, please report back.

### Acer ###
#### Aspire ####
  * 1360 series [c,d,1 - BIOS version 1.11 or newer only]
  * 1520 series [c,d,1 - BIOS version 1.11 or newer only]
  * 2920 series [c,d,3]
  * 3010 series [c,dw,1]
  * 3020 series [c,dw,1]
  * 3040 series [u,dw,3]
  * 3050 series [c,d,2]
  * 3100 series [c,d,2]
  * 3610 series [c,d,1]
  * 3620 series [c,d,3]
  * 3680 series [c,d,2]
  * 3690 series [c,d,2]
  * 3930 series [c,d,3]
  * 4520 series [c,d,2]
  * 4530 series [c,d,2]
  * 4315 series [c,d,3]
  * 4710 series [c,d,3]
  * 4720 series [c,d,2]
  * 4920 series [c,d,3]
  * 5010 series [c,d,1]
  * 5020 series [c,d,1]
  * 5040 series [c,d,3]
  * 5050 series [c,d,2]
  * 5100 series [c,d,2]
  * 5315 series [c,d,2]
  * 5520 series [c,d,2]
  * 5560 series [c,d,3]
  * 5570 series [c,d,2]
  * 5580 series [c,d,2]
  * 5600 series [c,d,2]
  * 5610 series [c,d,2]
  * 5630 series [c,d,2,k]
  * 5650 series [c,d,2,k]
  * 5670 series [c,d,2]
  * 5710 series [c,d,2]
  * 5715 series [c,d,2] (Confirmed by DMI)
  * 5720 series [c,d,2]
  * 5680 series [c,d,2,k]
  * 5920 series [c,d,2]
  * 5930 series [c,d,3]
  * 7110 series [c,d,3]
  * 7220 series [c,d,2]
  * 7520 series [c,d,2]
  * 7720 series [c,d,2]
  * 9110 series [c,d,2]
  * 9300 series [c,d,3]
  * 9420 series [c,d,3]
  * 9810 series [c,d,2]

#### Extensa ####
  * 4010 series [c,d,2]
  * 4220 series [c,d,3]
  * 5010 series [c,d,2]
  * 5220 series [c,d,3]
  * 5620 series [c,d,3]
  * 5630 series [c,d,2]
  * 7630 series [c,d,2]

#### Ferrari ####
  * 1000 series [c,d,2]
  * 1100 series [c,d,3]
  * 5000 series [c,d,2]

#### Travelmate ####
  * 2410 series [c,d,1]
  * 2420 series [c,d,3]
  * 2450 series [c,d,2]
  * 2480 series [c,d,2]
  * 2490 series [c,d,2,k]
  * 3010 series [c,d,2]
  * 3040 series [c,d,2]
  * 3260 series [c,d,2]
  * 3620 series [c,d,2]
  * 4200 series [c,d,2]
  * 4220 series [c,d,2]
  * 4230 series [c,d,2]
  * 4280 series [c,d,2]
  * 4400 series [c,d,1]
  * 4730 series [c,d,2]
  * 5320 series [c,d,3]
  * 5520 series [c,d,3]
  * 5620 series [c,d,3]
  * 5720 series [c,d,3]
  * 6290 series [c,d,3]
  * 6292 series [c,d,3] - Confirmed via DMI
  * 6490 series [c,d,2]
  * 6590 series [c,d,2]
  * 7510 series [c,d,3]
  * 7520 series [c,d,3]
  * 7720 series [c,d,3]
  * 8210 series [c,d,1]

### Fujitsu Siemens ###
#### Amilo ####
  * A1650 [c,d,1]

### Medion ###
#### MD ####
  * 98300 [c,d,1]

## TODO ##

The following laptops use a new WMI interface (which I've titled 'WMID v2'). This will need to be reverse engineered before these laptops will work with acer-wmi.

### Acer ###

#### Aspire ####

  * 4730 series [c,n,4]
  * 6390 series [c,n,4]


## Unsupported ##

This list is _very_ incomplete. The models listed here are the ones known to absolutely _not_ work with this driver - if you have one of these: it is not, cannot and will not be supported by acer\_acpi. (Some of these might be useable with acerhk, or the wireless/ bluetooth switches may be hardware driven instead and not require any software).

### Acer ###
#### Aspire ####
  * One series [c,d,2 - But the WMI implementation on this laptop doesn't actually do anything]
  * 1300 series [c,d,n]
  * 1310 series [c,d,n]
  * 1350 series [c,d,n]
  * 1360 series [u,d,n - Pre 1.11 BIOS (upgrade your BIOS to at least 1.11 to get WMI)]
  * 1410 series [c,d,n]
  * 1500 series [c,d,n (x86-64 capable)]
  * 1510 series [c,d,n (x86-64 capable)]
  * 1520 series [c,d,n (x86-64 capable) - Pre 1.11 BIOS (upgrade your BIOS to at least 1.11 to get WMI)]
  * 1640 series [c,d,n]
  * 1650 series [c,d,n]
  * 1670 series [c,dw,n]
  * 1680 series [c,d,n]
  * 1690 series [c,d,n]
  * 1700 series [c,d,n]
  * 2010 series [c,dw,n]
  * 3000 series [c,d,n]
  * 3030 series [u,dw,n]
  * 3500 series [c,d,n]
  * 3630 series [c,d,n]
  * 5000 series [c,d,n (x86-64 capable)]
  * 5030 series [c,d,n (x86-64 capable)]
  * 5500 series [c,d,n]
  * 5510 series [c,dw,n]

#### Extensa ####
  * 2900 series [c,d,n]
  * 4100 series [c,d,n]
  * 6700 series [c,d,n]

#### Ferrari ####
  * 3400 series [c,d,n]
  * 4000 series [c,d,n (x86-64 capable)]

#### Travelmate ####
  * C100 series [c,d,n]
  * C200 series [c,dw,n - has AMW0 device, but no WMAB method]
  * C300 series [c,d,n]
  * C310 series [c,d,n]
  * 220 series [c,d,n]
  * 240 series [c,d,n]
  * 290 series [c,d,n]
  * 350 series [c,dw,n]
  * 380 series [c,d,n]
  * 420 series [c,dw,n]
  * 430 series [c,dw,n,k]
  * 520 series [c,d,n]
  * 610 series [c,d,n]
  * 650 series [c,d,n]
  * 800 series [c,d,n]
  * 2200 series [c,dw,n]
  * 2300 series [c,d,n]
  * 2400 series [c,d,n]
  * 2700 series [c,dw,n]
  * 3000 series [c,dw,n]
  * 3200 series [c,d,n]
  * 4000 series [c,d,n]
  * 4020 series [c,d,n]
  * 4050 series [c,d,n]
  * 4100 series [c,d,n]
  * 4150 series [c,d,n]
  * 4500 series [c,d,n]
  * 4600 series [c,dw,n]
  * 4650 series [c,d,n]
  * 8100 series [c,d,n]

### Compal ###
  * CL56 [c,d,n]

### Prestigio ###

#### Nobile ####
  * 157 [c,d,n]

### Medion ###
#### MD ####
  * 42200 [c,d,n]
  * 95400 [c,d,n]
  * 96500 [c,d,n]

## Unknown ##

I have no information on these laptops either way - reports from the field (with DSDTs) would be much appreciated. (This list is also _very_ incomplete).

### Acer ###

#### Aspire ####
  * 2420 series [u,dw]
  * 4310 series [u,dw]
  * 4320 series [u,dw]
  * 5110 series [u,dw]
  * 5310 series [u,dw]
  * 5320 series [u,dw]
  * 5590 series [u,dw]
  * 5630 series [u,dw]
  * 5910 series [u,dw]
  * 7000 series [u,dw]
  * 7220 series [u,dw]
  * 7520 series [u,dw]
  * 9120 series [u,dw]
  * 9410 series [u,dw]
  * 9510 series [u,dw]
  * 9520 series [u,dw]
  * 9800 series [u,dw]
  * 9810 series [u,dw]
  * 9920 series [u,dw]

#### TravelMate ####
  * C210 series [u,dw]
  * 3020 series [u,dw]
  * 3040 series [u,dw]
  * 3270 series [u,dw]
  * 3290 series [u,dw]
  * 4260 series [u,dw]
  * 4270 series [u,dw]
  * 4320 series [u,dw]
  * 4520 series [u,dw]
  * 4720 series [u,dw]
  * 5220 series [u,dw]
  * 5310 series [u,dw]
  * 5610 series [u,dw] - Maybe supported, same manual as 5620
  * 6291 series [u,dw] - Strange name, taken from Acer's website
  * 6410 series [u,dw]
  * 6460 series [u,dw]
  * 7220 series [u,dw]
  * 7720 series [u,dw]