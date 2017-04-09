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
# This Script will replace a spaces in the filenames, of actual folder.
# Source:
#    http://www.linuxquestions.org/questions/linux-newbie-8/script-to-remove-spaces-from-multiple-filenames-265933/
#
# call:
#  replace_filenamespaces DIR
#
# parameter:
#   - DIR directory wher to replace
#
# History:
#  29.09.2011  Oesterholz  created
#


usage(){
	echo "Usage: $0 [directory]"
	exit 1;
}


test -d "$1" || usage

dir="$1"

ls $dir | grep -e "[:alnum:]" | \
while read i; do
	j=`echo -n "$i" | sed -e 's/ /_/'`
	echo mv "\"$dir/$i\"" "\"$dir/$j\""
done

