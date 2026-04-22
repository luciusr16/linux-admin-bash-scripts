#!/bin/bash 


# wrote this script as i spent a lot of time changing config files
# but before i made any changes i wanted to ensure i had a clean backup i could revert too if needed. 


read -r -p "enter the full path of the file you want to backup: " file 

if [[ ! -f "$file" ]]; then
  echo "file does not exist" 
  exit 1
fi 

timestamp=$(date +%Y=%m-%d_%H-%M-%S) # creates timestamp using the date command 
backup_file="${file}.${timestamp}.bak"  # builds the name of the backup file

cp "$file" "$backup_file" # copies the orignal file to the new backup file 

if [[ -f "$backup_file" ]]; then    
  echo "Backup created: $backup_file"  #  this if statement checks all was successful  
else 
  echo "Backup failed" 
  exit 1 
fi 



