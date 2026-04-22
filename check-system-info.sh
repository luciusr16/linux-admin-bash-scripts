#!/bin/bash 

# small bash script that prints an option menu
# prints system information based on choice of user 

echo "1) show uptime" 
echo "2) show memory usage" 
echo "3) show disk usage" 


read -r -p "please select an option: " choice  # stores users input as variable - choice 

case  $choice in      # their choice is matched to a number which then runs a command 
  1) uptime ;; 
  2) free -m ;;
  3) df -h ;; 
  *) echo "invalid choice"  
    exit 1 
    ;;
esac


