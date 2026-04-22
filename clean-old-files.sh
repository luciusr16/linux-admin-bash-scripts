#!/bin/bash 

# some of the directories on my linux server kept filling up 

# didnt want my disk to fill up and crash the machine 

# so i created a script that takes a dirctory and deletes file in it older than a certain number of days 

# you could have this script setup as a cron job to automate the cleanup of old files on your system 

read -r -p " enter directory to clean: " dir
read -r -p "delete files older than how many days? "  days 

if [[ ! -d "$dir" ]]; then 
  echo "invalid directory"
  exit 1  
fi 

if [[ ! "$days" =~ ^[0-9]+$ ]]; then 
  echo "invalid number of days" 
  exit 1
fi 


echo "deleting files older than $days days in the $dir directory..." 

read -r -p "Proceed with deletion? (y/n): " final_choice 


deleted=0 

case $final_choice in
  y) while read -r file; do 
    rm -rf "$file" 
    echo "deleted: $file"
    ((deleted++)) 
  done < <(find "$dir" -type f  -mtime +"$days" 2>/dev/null) ;;  
  n) echo "OK: Aborted" 
  exit 0 ;; 
  *) echo "invalid choice. please select y/n" 
  exit 1 ;; 
esac 

echo "total files deleted: $deleted"

# this can be modified for the directory and days to be set as fixed variables so it can run as cron job
# and it could run something like - deleting files in /var/log older than 30 days every month





