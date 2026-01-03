#! /bin/bash

#
# Usage
#./backup.sh

#!Description
# Simple bash script to perform backup task

read -p "Enter the directory path to be backed up: " dir_path

# Check if directory exists
if [[ ! -d "$dir_path" ]]; then
    echo "Error: Invalid Path,  Directory does not exist!"
    exit 1
fi

# Create backup directory
backup_dir="$dir_path/backup"
mkdir -p "$backup_dir"

for file in "$dir_path"/*; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        tar -czf "$backup_dir/${filename}_$(date +%F).tar.gz" "$file" 2> /dev/null
    fi
done

echo "Backup task completed successfully"
exit 0

