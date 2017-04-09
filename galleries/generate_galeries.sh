#!/bin/bash
#
# @author Betti Oesterholz 
# @mail webmaster@BioKom.info
#
# Copyright (C) @c GPL3 2012 Betti Oesterholz
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
# This Script generates the html files for some pictur galeries.
#
# History:
#  17.03.2012  Oesterholz  created
#

GALERIE_PATH="generated"
#PICTURE_PATH="../Bilder/Justine/"
PICTURE_PATH="/media/projekte/ausgang/HochzeitKatja/Bilder_CD/Bilder/Justine/"

PICTURES_TO_USE=$(ls ${PICTURE_PATH}*3-H-mod.JPG 2>/dev/null)

./generate_galerie.sh "${GALERIE_PATH}test" "Test galerie" "${PICTURES_TO_USE}"


