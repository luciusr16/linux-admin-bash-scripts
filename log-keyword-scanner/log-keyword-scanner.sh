#!/bin/bash 

# this script will take input like: ./log-keyword-scanner.sh   /var/log/secure   error 
# prints all  lines containing the word error
# then prints total count at the end

# assigning of variables here 

log_file="$1" #  log file user provides 
keyword="$2" # keyword user wants to use . e.g error, failed, timeout


if  [[ $# -eq 0 ]]; then 
    echo "usage $0  <log file>  <keyword>"
    exit 1    # shows the user how to use the script  
fi 

if [[ ! -f "$log_file" ]]; then   # checks log file is a valid file  
    echo "$log_file does not exist"
    exit 1 
fi 

count=0 # initializes a counter 

while read  -r  line; do   # reads the file line by line and each line becomes the variable line 
    if [[ "$line" == *"$keyword"*  ]]; then  # string comparison with a bash test
        echo "$line"
        ((count++))  # adds each match to the counter 
    fi
done < "$log_file"   # feeds file into the loop 

echo "
--------------------------------------------------------------"
echo "---------------SUMMARY------------------"     # shows summary of how many matches were found in the log file 
echo "total matches in $log_file for pattern $keyword is $count" 
