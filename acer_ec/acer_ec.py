#!/usr/bin/python

# Copyright (C) 2007  Michael Kurz     michi.kurz (at) googlemail.com
# Copyright (C) 2007  Petr Tomasek     tomasek (#) etf,cuni,cz
# Copyright (C) 2007-2008  Carlos Corbacho  carlos (at) strangeworlds.co.uk
#
# Version 0.7.0 (2008-06-14)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

import optparse
import string
import sys
import time

class IOPorts:

    def __init__(self, file="/dev/port"):
        """Open ports for usage"""
        try:
            self._ioports = open(file, "r+b", 0)
        except IOError:
            print "IOError", IOError
            sys.exit(1)

    def close_ioports(self):
        """Close ports"""
        self._ioports.close()

    def inb(self, port):
        """Mimic inb"""
        self._ioports.seek(port, 0)
        return ord(self._ioports.read(1))

    def outb(self, data, port):
        """Mimic outb"""
        self._ioports.seek(port, 0)
        self._ioports.write(chr(data))


class Controller:

    def __init__(self, ioports, port1, port2, readcmd=0x80, writecmd=0x81):
        self._ioports = ioports
        self._port1 = port1
        self._port2 = port2
        self._readcmd = readcmd
        self._writecmd = writecmd

    def _wait_write(self):
        """Delay writing until the controller port is ready"""
        inb = self._ioports.inb
        for i in range(10000):
            if (inb(self._port1) & 0x02) is not 0x2:
                return True
            else:
                time.sleep(0.001)
        raise IOError, "Unable to write to device"

    def _wait_read(self):
        """Delay reading until the controller port is ready"""
        inb = self._ioports.inb
        for i in range(10000):
            if (inb(self._port1) & 0x01) is 0x1:
                return True
            else:
                time.sleep(0.001)
        raise IOError, "Unable to read from device"

    def read(self, port):
        """Read a value from the specified port on the controller"""
        port = self._parse_value(port)
        try:
            if self._wait_write():
                self._ioports.outb(self._readcmd, self._port1)
            if self._wait_write():
                self._ioports.outb(port, self._port2)
            if self._wait_read():
                return self._ioports.inb(self._port2)
        except IOError:
                sys.exit(1)

    def write(self, port, value):
        """Write a value to the specified port on the controller"""
        port = self._parse_value(port)
        value = self._parse_value(value)
        try:
            if self._wait_write():
                self._ioports.outb(self._readcmd, self._port1)
            if self._wait_write():
                self._ioports.outb(port, self._port2)
            if self._wait_write():
                self._ioports.outb(value, self._port2)
        except IOError:
                sys.exit(1)

    def _get_registers(self, start, offset):
        """Return a list of the values from a range of specified registers"""
        registers = []
        for register in range(start, start + offset):
            registers.append(self.read(register))
        return registers

    def print_regs(self, rows=16, columns=16):
        """Print out all the registers"""
        print "".join(["\t%s" % hex(column) for column in range(columns)])
        print "".join(["\t___" for column in range(columns)])
        for row in range(rows):
            increment = rows * row
            start = 0 + increment
            print "%#04x" % (row * 16) + " |" + " ".join(["\t%3d" % value for value in
                                        self._get_registers(start, columns)])

    def _parse_value(self, value):
        if "x" in value:
            return string.atoi(value, 16)
        else:
            return int(value)

    def set_register(self, register, value):
        """Set a value for the specified register"""
        value = self._parse_value(value)
        register = self._parse_value(register)
        self.write(self._value, register)

    def _get_register(self, register):
        return self.read(register)

    def get_register(self, register):
        """Read the value from a specified register"""
        print self._get_register(register)

    def or_register(self, register, value):
        """OR register's contents with value (to set flags)"""
        self.write(register, self._get_register(register) | value)

    def and_register(self, register, value):
        """AND register's contents with ~value (to clear flags)"""
        self.write(register, self._get_register(register) & ~value)


def main(argv=None):
    if argv is None:
        argv = sys.argv

    ioports = IOPorts()
    ec = Controller(ioports, 0x66, 0x62)

    if not len(argv[1:]) > 0:
        print "help"
        sys.exit()

    options = {
        'regs': 'print_regs',
        ':=': 'set_register',
        '?=': 'get_register',
        '+f': 'or_register',
        '-f': 'and_register'
        }

    option = argv[1]

    if option in options.keys():
            call = getattr(ec, options[option])
            call(*argv[2:])

if __name__ == "__main__":
    sys.exit(main())
