#!/bin/sh

checkprocess()
{
	if [ "$1" = "" ]; then
		return 1
	fi
	
	process_num=`ps -ef |grep "$1" |grep -v "grep" |grep -v "$0" |wc -l`

	if [ $process_num -gt 0 ]; then
		return 0
	else
		return 1
	fi
}

if [ $# -gt 0 ]; then
	while [ 1 ] ; do
		checkprocess "$1"
		check_result=$?
		if [ $check_result -eq 1 ]; then
			systime=`date`
			echo "$systime : restart $1"
			$1 &
		fi
		sleep 3
	done
else
	echo "Usage: $0 command"
fi