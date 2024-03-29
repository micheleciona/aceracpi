# change KERNELSRC to the location of your kernel build tree only if
# autodetection does not work
#KERNELSRC=/usr/src/linux
#KERNELSRC=/usr/src/kernel-source-2.4.21-acpi-i2c-lmsensors
KERNELSRC?=/lib/modules/`uname -r`/build
KERNELVERSION=$(shell for f in ${KERNELSRC}/include/linux/{utsrelease.h,version.h}; do \
	test -f $$f && awk -F\" '/RELEASE/ {print $$2}' $$f && break; \
	done)

KBUILD_BASENAME=

# next line is for kernel 2.6, if you integrate the driver in the kernel tree
# /usr/src/linux/drivers/acer_acpi - or something similar
# don't forget to add the following line to the parent dir's Makefile:
# (/usr/src/linux/drivers/Makefile)
# obj-m                           += acer_acpi/
obj-m += acer_acpi.o

CC=gcc
CFLAGS+=-c -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe
INCLUDE=-I$(KERNELSRC)/include

TARGET := acer_acpi.ko
SOURCE := acer_acpi.c

all: $(TARGET)

help:
	@echo Possible targets:
	@echo -e all\\t- default target, builds kernel module
	@echo -e install\\t- copies module binary to /lib/modules/$(KERNELVERSION)/extra/
	@echo -e clean\\t- removes all binaries and temporary files

acer_acpi.ko: $(SOURCE)
	$(MAKE) -C $(KERNELSRC) SUBDIRS=$(PWD) modules

acer_acpi.o: $(SOURCE)
	$(CC) $(INCLUDE) $(CFLAGS) -DMODVERSIONS -DMODULE -D__KERNEL__ -DCONFIG_PM -o $(TARGET) $(SOURCE)

clean:
	rm -f *~ *.o *.s *.ko *.mod.c .*.cmd Module.symvers
	rm -rf .tmp_versions

load:	$(TARGET)
	insmod $(TARGET)

unload:
	rmmod acer_acpi

install: $(TARGET)
	mkdir -p ${DESTDIR}/lib/modules/$(KERNELVERSION)/extra
	cp -v $(TARGET) ${DESTDIR}/lib/modules/$(KERNELVERSION)/extra/
	depmod -a
