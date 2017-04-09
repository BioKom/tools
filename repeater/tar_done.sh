#!/bin/bash
#
# @author Betti Oesterholz 
# @mail webmaster@BioKom.info
#
# Copyright (C) @c GPL3 2007 Betti Oesterholz
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
# With this script you can compress the results of the repeater run.
#
# History:
#  06.03.2007  Oesterholz  created
#


FOLDER=.

#check if something is todo
if ! [ -e ${FOLDER}/done.txt ]; then
	echo "Keine Daten zum packen"
	exit 0
fi

COMPRESS_FOLDERS=`cat ${FOLDER}/done.txt`
DATE=$(date +"%d_%m_%Y")

echo "packe Daten:"
tar -czvf ${FOLDER}/done_${DATE}.tgz  ${COMPRESS_FOLDERS}

if ! [ $? ]; then
	echo "Fehler beim packen"
	exit -1
fi

#delete done data to alt
echo "sichere alte done.txt liste nach done_alt.txt"
mv  -fv ${FOLDER}/done.txt ${FOLDER}/done_alt.txt

echo "Lösche alte Daten"

for ACTUAL in ${COMPRESS_FOLDERS}
do
	rm -vrf ${FOLDER}/${ACTUAL}
done
















