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
# This SAcript defines what should be done be the repeater.
#
# History:
#  06.03.2007  Oesterholz  created
#

getFirstPart()
{
	echo $1
}

export ACTUAL_DIR=$(pwd)
export APPLICATION="nice -n 19 univers"
export PARAMETER_FILE=parameter.txt

export LOG_FILE=verlauf.txt

export STATISTIC_DIR=./statistik/
export STAISTIC_FILE=statistik.txt
export CUT_FILE=cut.txt
export REALTIME_FILE=rTime.txt
export PARTSIZE_FILE=partsize.txt

export UNIVERS_DIR=./universen/
export UNIVERS_BASIS_NAME=univ



#run application ( univers)
${APPLICATION} ${PARAMETER_FILE} >> ${LOG_FILE} 2>&1


#clean up

#reduce log-file
tail -n10000 ${LOG_FILE} > ${LOG_FILE}_tmp
if [ $? ];then
#if tail worked replace old log-file
	mv -f ${LOG_FILE}_tmp ${LOG_FILE}
fi


if [ -d ${UNIVERS_DIR} ]; then
#if a univers folder exists

	#clean up univers folder
	SIZE_IN_MB=$(du -ms ${UNIVERS_DIR})
	
	SIZE_IN_MB=$(getFirstPart ${SIZE_IN_MB})
	
	if [ ${SIZE_IN_MB} -gt 100 ]; then
	#if more then 100 MB
	#clean up univers folder
		cd ${UNIVERS_DIR}
		
		#save oldes univers
		OLDEST_UNIVERS=$(ls -t1 | head -n1)
		
		mkdir tmp_oldest_univ
		mv ${OLDEST_UNIVERS} tmp_oldest_univ/${OLDEST_UNIVERS}
		
		
		#delete to much universes
		for NUMBER_1 in 0 1 2 3 4 5 6 7 8 9
		do
			for NUMBER_2 in 0 1 2 3 4 5 6 7 8 9
			do
				for NUMBER_3 in 0 1 2 3 4 5 6 7 8 9
				do
					rm -f ${UNIVERS_BASIS_NAME}${NUMBER_1}${NUMBER_2}${NUMBER_3}*[1-9]*.txt
				done
				rm -f ${UNIVERS_BASIS_NAME}${NUMBER_1}${NUMBER_2}*[1-9]*.txt
			done
		done
		
		
		#restor oldest univers
		mv -f ./tmp_oldest_univ/* ./
		rm -fr tmp_oldest_univ
		
		cd ${ACTUAL_DIR}
	fi
fi



if [ -d ${STATISTIC_DIR} ]; then
#if a statistic folder exists
	SIZE_IN_MB=$(du -ms ${STATISTIC_DIR})
	
	SIZE_IN_MB=$(getFirstPart ${SIZE_IN_MB})
	echo "The statistic folder size is ${SIZE_IN_MB} MB"
	
	if [ ${SIZE_IN_MB} -gt 100 ]; then
	#if more then 100 MB
	#clean up statistic folder
	
		cd ${STATISTIC_DIR}
		echo "reduce statistic size"
		
		#shorten files
		for ACTUAL_FILE in ${STAISTIC_FILE} ${CUT_FILE} ${REALTIME_FILE} ${PARTSIZE_FILE}
		do
			#check file size
			if [ -e ${ACTUAL_FILE} ]; then
			#if the file exists
				SIZE_IN_MB=$(du -ms ${ACTUAL_FILE})
				echo "the ${ACTUAL_FILE} file size is ${SIZE_IN_MB} MB"
				
				SIZE_IN_MB=$(getFirstPart ${SIZE_IN_MB})
				
				if [ ${SIZE_IN_MB} -gt 10 ]; then
				#if file greater then 10 MB shorten it
				   echo "reduce ${ACTUAL_FILE} size"
				   
					grep -e '^[[:alpha:]]' -e '^[0-9][0-9][[:space:]]*;' -e  '^[0-9][0-9]0*0[[:space:]]*;' ${ACTUAL_FILE} > ${ACTUAL_FILE}.short
					if [ $? ]; then
					#if shorten file exists; replace longer Version
						mv -f ${ACTUAL_FILE}.short ${ACTUAL_FILE}
					fi
				fi
			fi
	
		done
	
		cd ${ACTUAL_DIR}
	fi
fi








