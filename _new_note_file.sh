#!/bin/bash

fullpath="$1"
output_dir="./src/content/notes"

# Check if filename is provided
if [ -z "$fullpath" ]; then
	echo "Usage: $0 <path/filename>"
	exit 1
fi

# Extract filename and path
filename=$(basename "$fullpath")
path=$(dirname "$fullpath")

# Add ".md" extension if not present in the filename
if [[ ! $filename == *.* ]]; then
	filename="$filename.md"
fi

# Ask user for parameters
read -p "Enter title (optional): " title
read -p "Enter description (optional): " desc

# Use the current date in the desired format
pubDate=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Create the directory structure if it doesn't exist
mkdir -p "$output_dir/$path"

# Create the file with the template
cat <<EOF >"$output_dir/$path/$filename"
---
title: ${title:-''}
description: ${desc:-''}
pubDate: $pubDate
---
EOF

echo "File '$output_dir/$path/$filename' created successfully."

# nvim "$output_dir/$path/$filename"
