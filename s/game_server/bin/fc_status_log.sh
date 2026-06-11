#!/bin/sh

keep_connection="NO"


function gen_status_command() {
while true; do
echo echo 
echo status
sleep 1
done
}

function gen_one_command() {
echo echo 
echo status
echo quit
}

touch status.log

if [ $keep_connection == "YES" ]; then
	gen_status_command | telnet 127.0.0.1 9002 | tee -a status.log
else
	while true; do
		gen_one_command | nc 127.0.0.1 9002 | tee -a status.log 
		sleep 1
	done
fi
