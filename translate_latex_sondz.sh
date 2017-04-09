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
# This Script converts german speciale characters to the latex control
# sequence in all "*.tex" files in the actual directory.
#
# History:
#  18.05.2008  Oesterholz  created
#


for datei in $(ls *.tex 2>/dev/null) $(ls *.bib 2>/dev/null)
do
	echo "Konverting file: ${datei}"
	sed -e "s/\xe4/\"a/g" -e "s/\xf6/\"o/g" -e "s/\xfc/\"u/g" -e "s/\xc4/\"A/g" -e "s/\xd6/\"O/g" -e "s/\xdc/\"U/g" -e "s/\xdf/\"s/g" \
	-e "s/\xc3\xa4/\"a/g" -e "s/\xc3\xb6/\"o/g" -e "s/\xc3\xbc/\"u/g" -e "s/\xc3\x84/\"A/g" -e "s/\xc3\x96/\"O/g" -e "s/\xc3\x9c/\"U/g" -e "s/\xc3\x9f/\"s/g" ${datei} > ${datei}.2
	mv -f ${datei}.2 ${datei}
done

