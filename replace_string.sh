#!/bin/bash
#
# @author Betti Oesterholz 
# @mail webmaster@BioKom.info
#
# Copyright (C) @c GPL3 2008 Betti Oesterholz
#
# This script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License (GPL) as
# published by the Free Software Foundation, either version 3 of the
# License, or any later version.
#
# This script is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this script If not, see <http://www.gnu.org/licenses/>.
#
#######################################################################
#
# This Script will replace a string in the files, of actual folder and all
# its subfolders, with an other string
#
# call:
#  replace_string.sh PatternToReplace ReplacePattern [FilePattern]
#
# parameter:
#   - PatternToReplace: the pattern which should be replaced
#   - ReplacePattern: the pattern to replace the PatternToReplace with
#   - FilePattern: the patterns of the files wher to replace
#
#
# History:
#  18.05.2008  Oesterholz  created
#

PatternToReplace=$1
ReplacePattern=$2

#echo "number of input parameters $#"

if [ $# -lt 3 ]; then
	FilePattern="*"
else
	FilePattern=$3
fi

echo "grep -R -l --exclude-dir=*\.* \"${PatternToReplace}\" ${FilePattern}"
Files=$(grep -R -l --exclude-dir=*\.* "${PatternToReplace}" ${FilePattern})

RETURNVALUE=$?
if [ ! ${RETURNVALUE} ]; then
	echo "could not find files"
	exit 1
fi

echo "Files wher the pattern will be replaced: " ${Files}

for datei in ${Files}
do
	echo "Konverting file: ${datei}"
#	sed -e "s/\"a/\xe4/g" -e "s/\"o/\xf6/g" -e "s/\"u/\xfc/g" -e "s/\"A/\xc4/g" -e "s/\"O/\xd6/g" -e "s/\"U/\xdc/g" -e "s/\"s/\xdf/g" ${datei} > ${datei}.2
#	echo "sed -e "s/${PatternToReplace}/${ReplacePattern}/g" -e ${datei} > ${datei}.2"
#	sed -e "s/${PatternToReplace}/${ReplacePattern}/g" ${datei} > ${datei}.2
	sed -e "s~${PatternToReplace}~${ReplacePattern}~g" ${datei} > ${datei}.2
	mv -f ${datei}.2 ${datei}
done

