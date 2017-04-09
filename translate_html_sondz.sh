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
# This Script converts german speciale characters to the html control
# sequence in all "*.html" and "*.htm" files in the actual directory.
#
# History:
#  23.10.2011  Oesterholz  created
#


for datei in $(ls *.htm 2>/dev/null) $(ls *.html 2>/dev/null)
do
	echo "Konverting file: ${datei}"
	sed -e "s/\xe4/\&auml;/g" -e "s/\xf6/\&ouml;/g" -e "s/\xfc/\&uuml;/g" -e "s/\xc4/\&Auml;/g" -e "s/\xd6/\&Ouml;/g" -e "s/\xdc/\&Uuml;/g" -e "s/\xdf/\&szlig;/g" \
	-e "s/\xc3\xa4/\&auml;/g" -e "s/\xc3\xb6/\&ouml;/g" -e "s/\xc3\xbc/\&uuml;/g" -e "s/\xc3\x84/\&Auml;/g" -e "s/\xc3\x96/\&Ouml;/g" -e "s/\xc3\x9c/\&Uuml;/g" -e "s/\xc3\x9f/\&szlig;/g" ${datei} > ${datei}.2
	mv -f ${datei}.2 ${datei}
done

