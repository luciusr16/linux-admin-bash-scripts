#!/bin/bash


file="$1"

if [[ $# -eq 0 ]]; then 
	echo "usage $0 <file>"
	exit 1 
fi 

if [[ ! -f "$file" ]]; then
	echo "file: $file does not exist"
	exit 1 
fi

while read -r host; do
	ping -c 1 -W 1 "$host" &>/dev/null
	if [[ $? -eq 0 ]]; then 
		echo "UP : $host"
	else 
		echo "DOWN: $host"
	fi 

done < "$file" 

