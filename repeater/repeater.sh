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
# Repeats the given command in al folders of the todo.txt file.
# retruns the number of not evaluated folders.
#
# History:
#  06.03.2007  Oesterholz  created
#  30.04.2007  Oesterholz  if the evaluation need weeks better don't use
#              Variables for over the time, values are stored to file are saver
#

RETURNVALUE=-1
EXECUTING_FOLDER=$(pwd)
EXECUTING_COMMAND=do.sh

if ! [ -e ${EXECUTING_FOLDER}/todo.txt ]; then
	 echo "No todo File in: ${EXECUTING_FOLDER}/todo.txt"
    exit 1
fi

rm -f  ${EXECUTING_FOLDER}/stoped.flg
date   >> ${EXECUTING_FOLDER}/starteded.flg
echo  "evaluation started" >> ${EXECUTING_FOLDER}/starteded.flg
cat   ${EXECUTING_FOLDER}/starteded.flg


#to make shur alle files are in linux format
dos2unix *.sh *.txt

LINES=$(wc -w < ${EXECUTING_FOLDER}/todo.txt)

while [ ${LINES} -ge 1 ];
do
	 ACTUAL=$(head --lines=1 ${EXECUTING_FOLDER}/todo.txt)
    #change folder
    
    echo 
    echo "Doing: ${ACTUAL} ************************"
    echo "cd ${ACTUAL}"
    cd ${ACTUAL}
    RETURNVALUE=$?
    
    if [ ${RETURNVALUE} ]; then
    	  #store $EXECUTING_FOLDER 
    	  echo ${EXECUTING_FOLDER} > executing_folder.txt
        
        #execute command
        ${EXECUTING_FOLDER}/${EXECUTING_COMMAND}
        RETURNVALUE=$?
        
        #refresh $EXECUTING_FOLDER
    	  EXECUTING_FOLDER=$(cat executing_folder.txt)
    	  rm -f executing_folder.txt

    else
        echo "error"
        ${ACTUAL} >> ${EXECUTING_FOLDER}/error.txt
        # executing not ok
        RETURNVALUE=1
    fi
    
    cd ${EXECUTING_FOLDER}
    
    #update todo, done and error txt-file
    if [ ${RETURNVALUE} ]; then
        echo ${ACTUAL} >> ${EXECUTING_FOLDER}/done.txt
    else
        echo ${ACTUAL} >> ${EXECUTING_FOLDER}/error.txt
    fi
    
    LINES=$(wc -l < ${EXECUTING_FOLDER}/todo.txt)
#    LINES=$(expr ${LINES} - 1)
    
    tail --lines=${LINES} ${EXECUTING_FOLDER}/todo.txt > ${EXECUTING_FOLDER}/todo_tmp.txt
    mv -f ${EXECUTING_FOLDER}/todo_tmp.txt ${EXECUTING_FOLDER}/todo.txt

    if [ -e ${EXECUTING_FOLDER}/stop.flg ]; then
        echo "Lines still todo: ${LINES}"
        exit ${LINES}
    fi

done

date   >> ${EXECUTING_FOLDER}/stoped.flg
echo  "evaluation stoped" >> ${EXECUTING_FOLDER}/stoped.flg
cat   ${EXECUTING_FOLDER}/stoped.flg
rm -f ${EXECUTING_FOLDER}/starteded.flg
exit 0
