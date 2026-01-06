#!/bin/bash

# Description:
# Automatc creating of directories with input from a file

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

while read -r dir; do

    if [[ -e "$dir" ]]; then
        echo "$dir already exists"
    else
        mkdir -p "$dir"
        echo "Created: $dir"
    fi

    sleep 1

done < "$1"

echo "Task completed !
exit 0
