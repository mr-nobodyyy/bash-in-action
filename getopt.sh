#!/bin/bash

while getopts "m:s:" switch; do 
	case $switch in
		s) 
			seconds="$OPTARG"
			echo $seconds
			;;
		
		m) 
			seconds=$(("$OPTARG * 60")) 
			echo  "$seconds sec"
			;;
			
		\?) 
			echo "invalid option"
			echo "Usage:"
			echo "$0 <option> <value> "
			echo "example : $0 -m 5"
			;;
	esac
	echo "countdown begins!"
	while [[ $seconds -ne 0 ]]; do
		echo "$seconds seconds remaining"
		seconds=$(( seconds-1 ))
		sleep 0.5
	done
	echo "Time is up!"
	break
done
