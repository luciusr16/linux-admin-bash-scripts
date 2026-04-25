#!/bin/bash 



logs="/var/log/secure"


if [[ ! -f "$logs" ]]; then
        echo "invalid file: $logs"
        exit 1
fi


ips=$(grep "Failed password" "$logs" | cut -d " " -f11 | sort | uniq -c)

echo  "---------------------------------------
Number of failed attempts via ssh from IPs
-----------------------------------------"

echo "$ips"
~                     
