#!/bin/bash 


# sets some coutners here 
max_attempts=5   # max amounts of times we will try
count=1  # initialise a counter to see how many attempts were made 

while (( count <= max_attempts )); do   # starts a loop here, runs repeatedly while condition is true, while utilising an artithmetic evaluation 
	echo "attempt $count..." # prints what attempt were on 

	ping -c 1 google.com &>/dev/null    #attempts to ping the host once

	if [[ $? -eq 0 ]]; then # $? - this special variable means the exit code of the last command
		echo "success: host is reachable"   
		exit 0  # if the command above has an error code 0 means it succeeded
	else
	echo "  failed, retrying"   # if not it means it failed 
	((count++))    # and it will add it to the counter called count on how many times it failed
	sleep 2    # just waits 2 seconds before retrying. 
	fi 	
done  

echo " all attmepts failed" 
exit 1 


