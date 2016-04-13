  * **Version 0.11.2 released 2008-03-12 (stable)**

acer\_acpi is a Linux kernel module to allow control of some of the hardware on later model Acer (and other Wistron OEM) laptops.

acer\_acpi was originally developed by Mark Smith to enable the wireless LAN card of an Acer Aspire 5024 under 64-bit Linux. The previous solution to hardware access on these laptops, Olaf Tauber's acerhk, relied on BIOS calls to work - unfortunately, it is not possible to call a 32-bit BIOS routine from a 64 bit operating system, so acer\_acpi was born.

If you want to contact the current maintainer, please use carlos(@)strangeworlds.co.uk (Carlos) or the aceracpi (General) mailing list.

8th February 2008 - acer-wmi, the upstream port of acer\_acpi, has now been merged into 2.6.25. acer\_acpi has now been deprecated in favour of acer-wmi, and is in bug-fix mode only for pre 2.6.25 kernels.

# Source #

acer\_acpi development has moved to Git - http://repo.or.cz/w/acer_acpi.git

The Subversion repository here will be kept for:

  1. Historical purposes
  1. DSDTs, data files, etc, (they will not be moved to Git)

# Packages #

You are recommended to use a newer kernel with acer-wmi, rather than acer\_acpi.

However, if you are still on an older kernel (2.6.24 or earlier), there are a few people who maintain packages for acer\_acpi, if you don't want to build it yourself. (NOTE: I do not produce or maintain any of these builds below, except for the SlackBuild. Do not send or file any bugs about them with me).

## Slackware/ Slamd64 ##

Build your own. My SlackBuild is here:
http://slackbuild.strangeworlds.co.uk/k/acer_acpi/

## Arch Linux ##

acer\_acpi is already included with Arch Linux by default.

## Fedora ##

The following packages are maintained by Nicolas (kwizart).

### Fedora 6 & 7 ###

(Replace 

&lt;version&gt;

 with 6 or 7, respectively).
```
wget http://rpm.livna.org/livna-release-<version>.rpm
rpm -ivh livna-release-<version>.rpm
yum install kmod-acer_acpi
```

### Fedora 8 ###

See http://rpmfusion.org

## Gentoo ##

acer\_acpi is already included in Portage.

## Ubuntu ##

### 8.04 (Hardy) ###

acer\_acpi is now shipped with Ubuntu.

### Pre Hardy ###

http://code.google.com/p/acer-acpi-deb