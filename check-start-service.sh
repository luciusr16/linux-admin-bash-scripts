#!/bin/bash 

check_and_start() {   # defines a fuction called check and start and functions let you  group logic and reuse it  
    service="$1"  # takes the first argument passed to the function  

    if systemctl  is-active --quiet "$service"; then # checks if service is running with an exit code of 0 or non zero for error or success  
        echo "RUNNING: $service"
    else 
        echo "NOT RUNNING:  $service"
        echo "STARTING SERVICE for........ $service"
        systemctl start "$service"

    if systemctl is-active --quiet "$service"; then  # command is ran again here to see if the command worked. if not if will say it failed 
        echo "STARTED  $service"
        systemctl status "$service"
    else
        echo "FAILED to start: $service"
    fi 
    fi 
} # to start and end the function you will need to use curly braces 

if [[ -z "$1" ]]; then       # quick if check to see if the user passed an argument -z is for empty 
    echo "usage: $0 <service_name>"
    exit 1 
fi 

check_and_start "$1"   # calls the function with the argumnent





