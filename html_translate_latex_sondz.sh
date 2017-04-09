#!/bin/bash
#
# @author Betti Oesterholz 
# @mail webmaster@BioKom.info
#
# Copyright (C) @c GPL3 2011 Betti Oesterholz
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
# This Script converts german speciale latex control sequence in all
# "*.html" files in the actual directory to the correct html sequences.
#
# History:
#  21.04.2011  Oesterholz  created
#  30.04.2011  Oesterholz  pictures will be linked localy
#


for FILE in $(ls *.html 2>/dev/null)
do
	echo "Konverting file: ${FILE}"
	sed -e "s/\"a/\\&auml;/g" -e "s/\"o/\\&ouml;/g" -e "s/\"u/\\&uuml;/g" -e "s/\"A/\\&Auml;/g" -e "s/\"O/\\&Ouml;/g" -e "s/\"U/\\&Uuml;/g" -e "s/\"s/\\&szlig;/g" -e "s/''/\"/g" -e "s/\`\`/\"/g" ${FILE} > ${FILE}.2
	#replace standart pictures
	sed -e "s/file:.*next.png/..\/pictures\/next.png/g" -e "s/file:.*up.png/..\/pictures\/up.png/g" -e "s/file:.*prev.png/..\/pictures\/prev.png/g" -e "s/file:.*contents.png/..\/pictures\/contents.png/g" -e "s/file:.*index.png/..\/pictures\/index.png/g" -e "s/file:.*crossref.png/..\/pictures\/crossref.png/g" -e "s/file:.*next_g.png/..\/pictures\/next_g.png/g" -e "s/file:.*up_g.png/..\/pictures\/up_g.png/g" -e "s/file:.*prev_g.png/..\/pictures\/prev_g.png/g" -e "s/IMG WIDTH=\"37\" HEIGHT=\"24\" ALIGN=\"BOTTOM\" BORDER=\"0\" ALT=\"next\"/IMG ALIGN=\"BOTTOM\" BORDER=\"0\" ALT=\"next\"/g" -e "s/IMG WIDTH=\"26\" HEIGHT=\"24\" ALIGN=\"BOTTOM\" BORDER=\"0\" ALT=\&uuml;p\"/IMG ALIGN=\"BOTTOM\" BORDER=\"0\" ALT=\"up\"/g" -e "s/IMG WIDTH=\"63\" HEIGHT=\"24\" ALIGN=\"BOTTOM\" BORDER=\"0\" ALT=\"previous\"/IMG ALIGN=\"BOTTOM\" BORDER=\"0\" ALT=\"previous\"/g" -e "s/IMG WIDTH=\"65\" HEIGHT=\"24\" ALIGN=\"BOTTOM\" BORDER=\"0\" ALT=\"contents\"/IMG ALIGN=\"BOTTOM\" BORDER=\"0\" ALT=\"contents\"/g" -e "s/IMG WIDTH=\"43\" HEIGHT=\"24\" ALIGN=\"BOTTOM\" BORDER=\"0\" ALT=\"index\"/IMG ALIGN=\"BOTTOM\" BORDER=\"0\" ALT=\"index\"/g" -e "s/ALIGN=\"BOTTOM\" BORDER=\"1\" ALT=\"\[\*\]\"/ALIGN=\"BOTTOM\" BORDER=\"0\" ALT=\"\[\*\]\"/g" ${FILE}.2 > ${FILE}.3
	
	
	mv -f ${FILE}.3 ${FILE}
	rm ${FILE}.2
done

