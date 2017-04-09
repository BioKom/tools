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
# This Script generates the html file for a pictur galerie.
#
# History:
#  17.03.2012  Oesterholz  created
#


TO_GENERATE_FILE_NAME=$1
TO_USE_NAME=$2
PICTURES_TO_USE=$3

DIR_BASE="../"
DIR_TUMBNAIL="Bilder_tumb/"
DIR_GENERATED="generated/"

TO_USE_GALERIE_NAME="${DIR_GENERATED}${TO_GENERATE_FILE_NAME}.html"
TO_USE_SLIEDESHOW_NAME="${DIR_GENERATED}${TO_GENERATE_FILE_NAME}_sl.html"



echo "Generating galerie with name \"${TO_USE_GALERIE_NAME}\" for pictures: \"${PICTURES_TO_USE}\""


echo "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\"" > ${TO_USE_GALERIE_NAME}
echo "   \"http://www.w3.org/TR/html4/frameset.dtd\">" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "<html>" >> ${TO_USE_GALERIE_NAME}
echo "  <head>" >> ${TO_USE_GALERIE_NAME}
echo "      <title>" >> ${TO_USE_GALERIE_NAME}
echo "         ${TO_USE_NAME}" >> ${TO_USE_GALERIE_NAME}
echo "      </title>" >> ${TO_USE_GALERIE_NAME}
echo "	<link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"${DIR_BASE}mittelalterGallery.css\">" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "	<!--defines for the picture galerie -->" >> ${TO_USE_GALERIE_NAME}
echo "	<style type=\"text/css\">" >> ${TO_USE_GALERIE_NAME}

PICTURE_NUMBER=1
for PICTURE_FILE in ${PICTURES_TO_USE}
do
	BASENAME=$(basename ${PICTURE_FILE})
	echo "		#scrollbox a.slide${PICTURE_NUMBER} {background:url(${DIR_TUMBNAIL}${BASENAME}) no-repeat center center;}" >> ${TO_USE_GALERIE_NAME}
	PICTURE_NUMBER=`expr ${PICTURE_NUMBER} + 1`
done

echo "	</style>" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "</head>" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "<body>" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "<div id=\"navigation\">" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "<ul>" >> ${TO_USE_GALERIE_NAME}
echo "<!--deactivete actual-->" >> ${TO_USE_GALERIE_NAME}
echo "	<li><a href=\"${DIR_BASE}index.html\">Hauptseite</a></li>" >> ${TO_USE_GALERIE_NAME}
echo "	<li><a href=\"${DIR_BASE}brautpaar.html\">Das Brautpaar</a></li>" >> ${TO_USE_GALERIE_NAME}
echo "	<li><a href=\"${DIR_BASE}all_pictures.html\">Bilder Auswahl</a></li>" >> ${TO_USE_GALERIE_NAME}
echo "	<li><a href=\"${DIR_BASE}fest.html\">Das Fest</a></li>" >> ${TO_USE_GALERIE_NAME}
echo "	<li><a href=\"${DIR_BASE}hergang.html\">Aktivit&auml;ten</a></li>" >> ${TO_USE_GALERIE_NAME}
echo "	<li><a href=\"${DIR_BASE}gaeste.html\">G&auml;ste</a></li>" >> ${TO_USE_GALERIE_NAME}
echo "	<li><a href=\"${DIR_BASE}burgStargard.html\">Burg Stargard</a></li>" >> ${TO_USE_GALERIE_NAME}
echo "</ul>" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "</div><!--navigation-->" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "<div id=\"head\">" >> ${TO_USE_GALERIE_NAME}
echo "	<div id=\"headDiashow\">" >> ${TO_USE_GALERIE_NAME}
echo "		<a href=\"${TO_USE_SLIEDESHOW_NAME}\"><img src=\"${DIR_BASE}picture_navi/diashow.png\"/></a>" >> ${TO_USE_GALERIE_NAME}
echo "	</div><!--headDiashow-->" >> ${TO_USE_GALERIE_NAME}
echo "	<div id=\"headLine\">" >> ${TO_USE_GALERIE_NAME}
echo "		<h1 align=\"center\">Bilder</h1>" >> ${TO_USE_GALERIE_NAME}
echo "	</div><!--headLine-->" >> ${TO_USE_GALERIE_NAME}
echo "</div><!--head-->" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "<div id=\"holder\">" >> ${TO_USE_GALERIE_NAME}
echo "	<ul id=\"scrollbox\">" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}

PICTURE_NUMBER=1
for PICTURE_FILE in ${PICTURES_TO_USE}
do
	PICTURE_TEXT="TEST"
	echo "		<li><a class=\"slide${PICTURE_NUMBER}\" tabindex=\"1\"><span><img src=\"${PICTURE_FILE}\" widht=\"99%\" height=\"95%\"/><br />${PICTURE_TEXT}</span></a></li>" >> ${TO_USE_GALERIE_NAME}
	PICTURE_NUMBER=`expr ${PICTURE_NUMBER} + 1`
done


echo "	</ul>" >> ${TO_USE_GALERIE_NAME}
echo "</div> <!-- end of holder -->" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "</body>" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}
echo "</html>" >> ${TO_USE_GALERIE_NAME}
echo "" >> ${TO_USE_GALERIE_NAME}



echo "Generating slideshow with name \"${TO_USE_GALERIE_NAME}\" "


echo "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\"" > ${TO_USE_SLIEDESHOW_NAME}
echo "   \"http://www.w3.org/TR/html4/frameset.dtd\">" >> ${TO_USE_SLIEDESHOW_NAME}
echo "" >> ${TO_USE_SLIEDESHOW_NAME}
echo "<html>" >> ${TO_USE_SLIEDESHOW_NAME}
echo "  <head>" >> ${TO_USE_SLIEDESHOW_NAME}
echo "      <title>" >> ${TO_USE_SLIEDESHOW_NAME}
echo "         ${TO_USE_NAME}" >> ${TO_USE_SLIEDESHOW_NAME}
echo "      </title>" >> ${TO_USE_SLIEDESHOW_NAME}
echo "" >> ${TO_USE_SLIEDESHOW_NAME}
echo "	<link rel=\"stylesheet\" type="text/css" media=\"screen\" href=\"mittelalterDiashow.css\">" >> ${TO_USE_SLIEDESHOW_NAME}
echo "" >> ${TO_USE_SLIEDESHOW_NAME}
echo "<!--defines for the diashow -->" >> ${TO_USE_SLIEDESHOW_NAME}
echo "	<script language=\"JavaScript\" src=\"diashow.js\"></script>" >> ${TO_USE_SLIEDESHOW_NAME}
echo "	<script language=\"JavaScript\">" >> ${TO_USE_SLIEDESHOW_NAME}
echo "	<!--" >> ${TO_USE_SLIEDESHOW_NAME}
echo "		Banner.img = 'DiashowBild';" >> ${TO_USE_SLIEDESHOW_NAME}

for PICTURE_FILE in ${PICTURES_TO_USE}
do
	echo "		Banner.Add('${PICTURE_FILE}','all_pictures.htm');" >> ${TO_USE_SLIEDESHOW_NAME}
done

echo "	//-->" >> ${TO_USE_SLIEDESHOW_NAME}
echo "	</script>" >> ${TO_USE_SLIEDESHOW_NAME}
echo "" >> ${TO_USE_SLIEDESHOW_NAME}
echo "</head>" >> ${TO_USE_SLIEDESHOW_NAME}
echo "" >> ${TO_USE_SLIEDESHOW_NAME}
echo "<body onload=\"Banner.Start()\">" >> ${TO_USE_SLIEDESHOW_NAME}
echo "		<a href=\"#\" ><img src=\"\" name=\"DiashowBild\" height=95%  style=\"float:center\" hspace=16 vspace=16 border=\"0\"></a>" >> ${TO_USE_SLIEDESHOW_NAME}
echo "</body>" >> ${TO_USE_SLIEDESHOW_NAME}
echo "" >> ${TO_USE_SLIEDESHOW_NAME}
echo "</html>" >> ${TO_USE_SLIEDESHOW_NAME}













