#!/bin/bash 


file="$1"

if [[ $# -eq 0 ]]; then
    echo "usage $0 <file"
else
    exit 1  
fi 

if [[ ! -f "$file" ]]; then
    echo "invalid file: $file"
    exit 1 
fi 

while read -r dir; do  
    if [[ -z "$dir" ]]; then
        continue
    fi 

    if [[ -d "$dir" ]]; then
        echo "EXISTS: $dir"
    else
        mkdir -p "$dir"
        echo "CRETAED $dir"
    fi 
done < "$file"
