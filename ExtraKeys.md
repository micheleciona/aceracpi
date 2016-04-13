# Disclaimer #

I am _not_ a HAL developer (although as of 1st April 2008, I do have commit access to hal-info) - I just think it's about time someone came up with a proper solution to the non-functioning keys problem, and this one from the HAL developers is the best one of the lot.

And since a lot of Acer laptop users come through here, I might as well try to steer them into something useful.

# Background #

Keys (usually!) generate scan codes. The Linux kernel (in particular, atkbd.c)
maps the scan codes to keycodes. To be able to map X to the keys, or for them
to be recognised and do anything useful, you need a keycode.

Standard keys (i.e. the "normal" 104 keys on your keyboard - e.g. A-Z, 0-9, etc) generate standard scancodes which have a standardised mapping to keycodes inside the kernel - so all works well there.

However - many of the extra keys on Acer laptops do _not_ generate standard scancodes - hence you get errors in dmesg as the kernel does not know what keycodes these unknown scancodes should be mapped to.

(Unlike some other laptops though, nearly all the keys on Acer laptops do generate scancodes, so we don't need extra kernel drivers to work them).

# Problem: #

Kernel policy is that this mapping of extra/ unknown keys should _not_ be done in the kernel (or by kernel drivers) - it should be done by user space.

Until recently, there was no 'unified' place to do this - (U/K/X)buntu and SuSE adopted hotkey-setup, other distributions adopted different methods, or none at all. Or in some cases, users had to rely on doing this mapping themselves, leading to more inconsistency.

# Solution #

The ["Unfuck my keyboard"](http://hughsient.livejournal.com/29730.html) project aims to move all this keyboard mapping into HAL, since HAL is a far better cross-platform solution to the problem (and since Slackware 12.0 now includes HAL, I (Carlos) am now happy to support such an initiative :-)

HAL will use DMI data (aka ask the BIOS) to find out what your laptop is, then match this to user submitted data to map the scancodes-to-key codes appropriately. This functionality is available in HAL 0.5.10 and later versions.

What HAL needs is information from users on which keys to map scancodes to for different laptops.

# What you need to do #

**I am happy to produce and submit patches to HAL on your behalf**. I will need you to e-mail the following to me (Carlos - carlos(@)strangeworlds.co.uk):

((U/K/X)buntu and SuSE users: If you have hotkey-setup installed, _please_ disable
or remove it and then reboot before doing this).

1) Make and model of your laptop.

2) The output of:

```
dmidecode --string system-manufacturer
dmidecode --string system-product-name
```

3) And:

A list of all the keys which generate error messages in 'dmesg', and the
scancode they report (just try all the keys, and all valid Fn+Key
combinations, and report back those that generate an atkbd.c message in
dmesg).

Ideally, this should be done in runlevel 3, to stop X or any X daemons from interfering with this. As root:
```
telinit 3
```
e.g. On my laptop, pressing the wireless button (with wireless off) produces
this in dmesg:
```
atkbd.c: Use 'setkeycodes e056 <keycode>' to make it known.
```
The scancode I need from you is e056, so you would tell me something like:

wireless button (wireless off) = e056

For example, on my Aspire 5020 I get the following:

  * Fn+F1 = e025
  * Fn+F2 = e026
  * Fn+F3 = e027
  * Fn+F5 = e029
  * Fn+F7 (turn touchpad off) = e072
  * Fn+F7 (turn touchpad back on) = e071
  * Euro sign (the one left of "up" arrow) = e033
  * Dollar sign (the one right of "up" arrow) = e034
  * Acer "e" button = e074
  * Acer "P" button = e073

These next four scancodes might be a bit different on your laptop because the
on/ off thing may not quite work the same, or the hardware isn't there but
you have the button (e.g. bluetooth - if the button is there, press it
anyway):

  * Wireless button (wireless on) = e055
  * Wireless button (wireless off) = e056
  * Bluetooth button (bluetooth on) = e057
  * Bluetooth button (bluetooth off) = e058

(Also, on some newer laptops, apparently Fn+Left/ Right also generate scancodes)

Be aware that:

The wireless and bluetooth buttons will probably report different scancodes
depending on whether you have enabled the device or not.

Not all keys will generate error messages in dmesg (e.g. on my Aspire 5021,
the multimedia keys are already mapped to proper keycodes by the kernel, and
the brightness keys do not emit any scancodes).

If you have a key which is already mapped, but to the wrong keycode, also let me know.

# X #

The next step is to map the kernel key codes to X key codes for X (so you can use these keys with your favourite window manager/ desktop environment).

You can use either the 'acer\_laptop' keyboard layout, or use the evdev driver (I use evdev).