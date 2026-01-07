#! /bin/bash
#Usage:
# ./readarray.sh <input_file_path>

# Description:
# using readarray to automate creation and removal of files



if [[ -z $1 ]] ; then
	echo "Error: Wrong argument"
	echo "usage: $0 <file path>"
fi

readarray -t files < <(cat $1)

for file in "${files[@]}" ; do
	echo $file
	if [[ -f "$file.txt" ]] ; then
		echo "$file.txt aready exists !"
		rm "$file.txt"
		echo "$file.txt remoced"
	else
		touch "$file.txt"
		echo "$file.txt created successfully !"
	fi
done
