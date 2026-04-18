#!/bin/bash 

# so you will give this script a directory and it will tell you how many files and directores are inside. 

read -r -p "enter a directory: " dir #takes input from user and stores in dir variable 

if [[ ! -d "$dir" ]]; then # checks if valid directory
  echo "invalid directory" 
  exit 1 # if not = error
fi 

#creates two counter variables below. one for files and other for directory. 
file_count=0 
dir_count=0 

for item in "$dir"/*; do  # loops through everything in directory 
  if [[ -f "$item" ]]; then # then checks if its a file 
    (( file_count++))  # if it is then will add do counter
  elif [[ -d "$item" ]]; then # checks if directory 
    ((dir_count++))  # if it is then store in counter 
  fi 
done 

# then just output how many files and  directories to user 
echo "Files: $file_count" 
echo "Directories: $dir_count"


