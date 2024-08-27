#!/bin/bash

# Ensure both input and output directories are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    exit 1
fi

input_dir="$1"
output_dir="$2"

# Find all .musx files in the input directory and copy them to the output directory
find "$input_dir" -type f -name "*.musx" -exec cp {} "$output_dir" \;

echo "All .musx files have been copied to $output_dir."
