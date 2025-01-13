#!/bin/bash

find . -maxdepth 1 -type f \
    ! -name "README.md" \
    ! -name ".gitignore" \
    ! -name "previews.sh" \
    ! -name ".DS_Store" \
    ! -name "._*" \
    ! -path "./.git/*" \
    ! -name "$(basename "$0")" | while read -r file; do

    filename=$(basename "$file")

    echo "#### $filename" >> README.md
    echo "![$filename](https://raw.githubusercontent.com/GMkonan/wallpapers/main/$filename)" >> README.md
    echo "" >> README.md
done

echo "Content has been appended to README.md successfully!"
