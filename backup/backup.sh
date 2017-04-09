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
# Backups Folders in /home to /home/sicher
#
# History:
#  10.03.2007  Oesterholz  created
#  10.03.2014  Oesterholz  tar options --ignore-failed-read
#  	--ignore-command-error added
#

STAGE=0
LOG_FILE=./log.txt
EXECUTING_FOLDER=`pwd`
SICHER_DIR=${EXECUTING_FOLDER}/Backup/BioKom_home
HISTORY_FILE=${EXECUTING_FOLDER}/history.txt


#empty log file
rm -f ${LOG_FILE}

REPEAT_FOR_DIRS=`cat ${EXECUTING_FOLDER}/todo.txt`

for ACTUAL_DIR in ${REPEAT_FOR_DIRS}
do

	#exists stop flag?
	if [ -e ${EXECUTING_FOLDER}/stop.flg ]; then
		cp -f ${HISTORY_FILE} ${SICHER_DIR}
		echo "Stop in Phase: ${STAGE}"
		exit ${STAGE}
	fi
	
	STAGE=`expr ${STAGE} + 1 `
	
	echo "Sichere ${ACTUAL_DIR}"
	
	#save old folder
	mv -f   ${SICHER_DIR}/${ACTUAL_DIR}      ${SICHER_DIR}/${ACTUAL_DIR}_alt
	mkdir  ${SICHER_DIR}/${ACTUAL_DIR}
	
	cp -afvrp ${EXECUTING_FOLDER}/${ACTUAL_DIR}/*  ${SICHER_DIR}/${ACTUAL_DIR}/ >> ${LOG_FILE} 2>&1
# TODO test
#	mv -f ${SICHER_DIR}/${ACTUAL_DIR}.tgz      ${SICHER_DIR}/${ACTUAL_DIR}_alt.tgz
#	tar --ignore-command-error --ignore-failed-read -czvf ${SICHER_DIR}/${ACTUAL_DIR}.tgz ${EXECUTING_FOLDER}/${ACTUAL_DIR}/* >> ${LOG_FILE} 2>&1
	
	RETURNVALUE=$?
	#error while prozeccing
	if [ ${RETURNVALUE} -ne 0 ]; then
		echo "Fehler bei der Ausfuehrung: ${RETURNVALUE}  in Phase: ${STAGE}"
		#revert changes if possible
		mv -f   ${SICHER_DIR}/${ACTUAL_DIR}_alt      ${SICHER_DIR}/${ACTUAL_DIR}
		mv -f ${SICHER_DIR}/${ACTUAL_DIR}_alt.tgz      ${SICHER_DIR}/${ACTUAL_DIR}.tgz
#		exit ${STAGE}
	else
		#remove old folder
		rm -fr ${SICHER_DIR}/${ACTUAL_DIR}_alt
		rm -f ${SICHER_DIR}/${ACTUAL_DIR}_alt.tgz
		
		#update/rotate todo.txt
		#remove first line from todo.txt
		LINES=`wc -l < ${EXECUTING_FOLDER}/todo.txt` 
		LINES=`expr ${LINES} - 1 `
		
		tail --lines=${LINES} ${EXECUTING_FOLDER}/todo.txt > ${EXECUTING_FOLDER}/todo_tmp.txt
		mv -f ${EXECUTING_FOLDER}/todo_tmp.txt ${EXECUTING_FOLDER}/todo.txt
		#put actual dir to the at the end of todo.txt
		echo ${ACTUAL_DIR} >> ${EXECUTING_FOLDER}/todo.txt
		
		#write history entry
		echo -n "${ACTUAL_DIR}  : " >> ${HISTORY_FILE}
		date >> ${HISTORY_FILE}
	fi
	
done

cp -f ${HISTORY_FILE} ${SICHER_DIR}
echo "Alles gesichert"
exit 0

