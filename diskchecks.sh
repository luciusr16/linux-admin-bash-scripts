#!/bin/bash 

# the purpose of this script is to check all mounted filesystems and print the status of each

# counts how many are above the threshold  
# then prints a summary at the end to inform the user 

THRESHOLD=80 #sets the disk usage limit   
WARN_COUNT=0 # counter for how many filesystems exceed 

echo "-----------DISK REPORT-----------"  
echo "-----------THRESHOLD: ${THRESHOLD}%" # the header 

echo 

while read -r fs size used avail percent mount; do # reads each line of output and assigns a varibale to each line 

  percent=${percent%\%} # removes percent symbol at end of string 

  if (( percent >+ THRESHOLD )); then # arithemtic evaluation so no $  needed
    echo "WARNING: $mount is ${percent}% full " # if above threshold print warning and add to warning counter 
    ((warn_count++))
  else 
    echo "DISK IS FINE: $mount is ${percent}% full" # if disk is below threshold prints disk is fine message  
  fi 

done < <(df -h | tail -n +2) # sends the entire loop through this command 

echo  
echo "TOTAL WARNINGS ARE : $warn_count" # shows user the final warnings 


