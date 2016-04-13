# Very Important Person #

I'm delighted to report that following my request in the section below, someone who uses aceracpi and has contributed patches and suggestions has volunteered to take over maintainership.  :)  More soon, along with version 0.5!

On a personal note, thanks to everyone who's contributed, asked questions, sent suggestions, or simply sent a "thanks" email to me, and thanks again to all those on whose shoulders I stood to make this thing work ... aceracpi started in the way these projects do, as an itch that needed scratching, a problem that HAD to have a solution, and even though I haven't been able to keep up with it myself I'm happy to see that lots of people have found it of use, and that someone feels strongly enough to take it over and keep the ball rolling.

# Important #

_I don't user aceracpi any more, I'm afraid - I've moved on to a laptop that actually has supported hardware.  I'm keeping these pages up as a resource for anyone who DOES use aceracpi, and as a historical record.  I'm still happy to answer questions where I can, or receive patches, but I'm not actively developing aceracpi any longer.  If anyone wants to take the module over, please mail me._

# Introduction #

Welcome to the development site for aceracpi, a Linux kernel module to allow control of some of the hardware on later model Acer (and other Wistron OEM) laptops.

aceracpi was originally developed to enable the wireless LAN card of an Acer Aspire 5024 under 64-bit Linux (Fedora Core 4). The previous solution to hardware access on these laptops, Olaf Tauber's acerhk, relied on BIOS calls to work - unfortunately, it is not possible to call a 32-bit BIOS routine from a 64 bit operating system, so acer\_acpi was born.

aceracpi builds on Olaf's fantastic work with acerhk, as well as the work of several other developers working on laptop hardware control for Linux, such as John Belmonte (author of the toshiba\_acpi kernel module, which was a huge inspiration).

# Disclaimer #

aceracpi is rather new, very basic, and has had very limited testing. In other words, it works for me. If you try it and it breaks your hardware, you get to keep the pieces.  _There is no warranty on this software!_

# What aceracpi does #

aceracpi creates entries under `/proc/acpi/acer`, which enable you to control the wireless LAN card, inbuilt Bluetooth adapter, and mail LED of your laptop. The syntax for each is the same:

## To enable a feature: ##
`echo "enabled : 1" > /proc/acpi/acer/{feature} `

## To disable a feature: ##
`echo "enabled : 0" > /proc/acpi/acer/{feature} `

Where {feature} is either `wireless`, `bluetooth`, or `mailled`.

# What aceracpi **doesn't** do #

Olaf Tauber's acerhk was developed to also allow access to extra keys on Acer laptops. acer\_acpi doesn't do this. Yet. Many of the extra keys already emit scancodes on a 2.6 series kernel. I thoroughly recommend use of a late version of Ubuntu or Fedora Core, which seem to handle nearly all the keys 'out of the box'.

# License #

aceracpi is licensed under the GNU General Public License (GPL) version 2.

# Download and Installation #

You will need a C compiler, some basic development utilities (GNU make, install), and the kernel headers installed.

If you don't know whether you have these, or how to install them, I'd suggest searching the discussion forums for your Linux distribution. I'm afraid I cannot give you any assistance with installation!

  * Download the latest version of the source from the [Downloads](http://code.google.com/p/aceracpi/downloads/list) page.
  * Extract and build the sources:

```
tar zxvf acer_acpi-0.4.tar.gz
cd acer_acpi-0.4
make
```

  * If the compile is successful, as root:

```
make install
modprobe acer_acpi
```

  * Assuming your kernel is still running(!), check out `dmesg` to see if the driver installed correctly, then check the `/proc/acpi/acer` directory to see if the control files are there.

You may also want to check out the [frequently asked questions (FAQ)](http://code.google.com/p/aceracpi/wiki/FAQ).

Previous versions are archived on the site, in case I've introduced any regressions.

# Contact me #

You can contact me with comments, suggestions, or patches for acer\_acpi via email, aceracpi@archernar.co.uk

I'm particularly keen to receive reports of laptop models other than the 5020 series that aceracpi does work on, or patches to make it work on other models, so I can put a "supported hardware" section on this page.
I will also try to help with debugging if aceracpi doesn't work for you, but it may take me a while to respond as real life may get in the way.

# Notes and Issues #

Sometimes when you attempt to load the driver, it fails as it is unable to register with the kernel ACPI subsystem. If anyone knows why this occurs, please contact me! Usually a second attempt at modprobe will allow the driver to load.

If anyone out there has experience with Linux ACPI, particularly how to catch a process notify events properly, please email. Getting the non-supported keys to work will, I suspect, rely on trapping the notification the hardware gives and then reading the relevant data via ACPI. What to do with them then is the other big question ... is it possible to emit keyboard events to the kernel?

# Revision History #

  * 2007-03-31 version 0.4 released

Now compiles on current 2.6 series kernels.
References to acer\_acpi's home changed to code.google.com/p/aceracpi

  * 2005-10-16 version 0.3 released

Bugfix for the double modprobe, couple of code tidies, sorry for the long delay!

  * 2005-08-28 version 0.2 released

The first public version of aceracpi.

  * 2005-08-27 version 0.1

Test version, used by a whole two people :-)
