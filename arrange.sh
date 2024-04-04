#!/bin/bash

ls -al
files_folder="./files"

if [ ! -d "$files_folder" ]; then
    echo "Error: 'files' folder not found."
    exit 1
fi

alphabet_folders="./[a-z]"

if [ ! -d "$alphabet_folders" ]; then
    echo "Error: Alphabet folders not found."
    exit 1
fi

chmod +w $alphabet_folders

for file in "$files_folder"/*; do

    if [ -f "$file" ]; then
        first_char=$(basename "$file" | cut -c1)
        mv "$file" "./$first_char"
        echo "Moved $(basename "$file") to ./$first_char"
    fi
done
