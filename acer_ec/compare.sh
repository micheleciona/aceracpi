#!/bin/bash

#Copyright (C) 2007  Maurizio Monge maurizio.monge (at) gmail.com
#
#Version 0.1 (2007-09-04)
#
#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 3
#of the License, or (at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.


if [ "$2" == "-" ]; then
	FILES=( "$1" )
else
	FILES=( "$1" "$2" )
fi

for F in "${FILES[@]}"; do
	if [ ! -e "$F" ]; then
		echo "No such file: $F"
		echo "Usage: ./compare.sh file1 file2  -or-"
		echo "       ./compare.sh file1 - (reads stdin)"
		exit 1
	fi
done

exec 3<"$1"

if [ "$2" == "-" ]; then
	exec 4<&0
else
	exec 4<"$2"
fi

EXA=( _ 0 1 2 3 4 5 6 7 8 9 A B C D E F )
while read -u 3 A; do
	read -u 4 B
	L="${A:0:1}"
	if [ "${A:3:1}" != "|" ]; then continue; fi
	AL=( ${A//|/} )
	BL=( ${B//|/} )
	for i in `seq 1 16`; do
		if [ "${AL[$i]}" != "${BL[$i]}" ]; then
			echo "REG[0x${L}${EXA[$i]}]: `printf '0x%02x' ${AL[$i]}` --> `printf '0x%02x' ${BL[$i]}`"
		fi
	done
done

