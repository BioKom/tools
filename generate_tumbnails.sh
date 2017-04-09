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
# This Script converts all image files in the actual directory to
# tumbnails.
#
# call:
#	generate_tumbnails.sh [TUMBNAIL_FOLDER]
#
# parameter:
#	TUMBNAIL_FOLDER: path to the folder wher the tumbnails should be stored to
#
# History:
#  10.11.2011  Oesterholz  created
#  07.06.2012  Oesterholz  functionality around TUMBNAIL_FOLDER added
#

TUMBNAIL_FOLDER="./tumb/"

if [ $# -ge 1 ]; then
	TUMBNAIL_FOLDER=$1
fi

if [ ! -d ${TUMBNAIL_FOLDER} ]; then
	mkdir ${TUMBNAIL_FOLDER};
fi;


for datei in $(ls *.jpg 2>/dev/null) $(ls *.JPG 2>/dev/null)
do
	echo "Konverting file: ${datei}"
	convert -size 120x120 "${datei}" -resize 120x120 +profile '*' "${TUMBNAIL_FOLDER}${datei}"
done

