#!/bin/bash

find . ./active -maxdepth 1 -type f \
    ! -name "README.md" \
    ! -name ".gitignore" \
    ! -name "previews.sh" \
    ! -name ".DS_Store" \
    ! -name "._*" \
    ! -path "./.git/*" \
    ! -path "./small/*" \
    ! -name "$(basename "$0")" | while read -r file; do
    # Extract the file name without the folder origin
    file_name=$(basename "$file")
    
    # Construct the file path in the desired format
    if [[ "$file" == ./active/* ]]; then
        file_path="active/$file_name"
    else
        file_path="$file_name"
    fi

    echo $file_name
    echo "#### $file_name" >> README.md
    echo "![$file_name](https://raw.githubusercontent.com/GMkonan/wallpapers/main/$file_path)" >> README.md
    echo "" >> README.md
done

echo "Content has been appended to README.md successfully!"
