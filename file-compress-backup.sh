#!/bin/bash 

die() {
    echo "ERROR: $1" >&2
    exit 1 
} 


dir="$1"

[[ $# -eq 0 ]] && die "usage: $0 <directory> to back up"

[[ ! -d "$dir" ]] && die "invalid directory: $dir"


backup_folder="/backup-folder"
backup_file="$backup_folder/$(basename "$dir").backup.$(date +%F).tgz"

sudo mkdir -p "$backup_folder"
sudo chmod 775 "$backup_folder"

if sudo tar -czf "$backup_file" "$dir"; then
    echo "Your directory: $dir has been backed up at: $backup_file"
else
    die "BACKUP FAILED"
fi  
