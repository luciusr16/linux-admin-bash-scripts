#!/bin/bash 

# scipt to check all the mounted disks on your linux system 

threshold=80 

while read -r  filesystem size used avail use mount; do
    use=${use%\%}
    if (( use >= threshold  )); then 
        echo "WARNING: $mount is ${use}% full. Above THRESHOLD = $threshold"
    else 
        echo "OK: $mount is ${use}% full. Below THRESHOLD = $threshold"
    fi
done < <(df -h | tail -n +2) 
