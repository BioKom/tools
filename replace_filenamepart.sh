#!/bin/bash
#
# @author Betti Oesterholz 
# @mail webmaster@BioKom.info
#
# Copyright (C) @c GPL3 2010 Betti Oesterholz
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
# This Script will replace a substring in the filenames, of actual folder
#
# call:
#  replace_filenamepart.sh PatternToReplace ReplacePattern
#
# parameter:
#   - PatternToReplace: the pattern which should be replaced
#   - ReplacePattern the pattern to replace the PatternToReplace with
# 
#
# History:
#  18.05.2008  Oesterholz  created
#

PatternToReplace=$1
ReplacePattern=$2

echo "ls *${PatternToReplace}*"
Files=$(ls *${PatternToReplace}*)

RETURNVALUE=$?
if [ ! ${RETURNVALUE} ]; then
	echo "could not find files"
	exit 1
fi

echo "Files wher the pattern in ther name will be replaced: " ${Files}

for File in ${Files}
do
	echo "Konverting file: ${File}"
	NewFilname=$(echo "${File}" | sed -e "s/${PatternToReplace}/${ReplacePattern}/g")
	mv -f "${File}" "${NewFilname}"
done

