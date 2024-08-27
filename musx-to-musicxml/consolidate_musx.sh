#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Ensure both input and output directories are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    exit 1
fi

input_dir="$1"
output_dir="$2"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Find all .musx files in the input directory, excluding those in the output directory, and copy them to the output directory
# Use find with -prune to avoid descending into the output directory
find "$input_dir" -type d -name "$(basename "$output_dir")" -prune -o -type f -name "*.musx" -exec cp {} "$output_dir" \;


echo "All .musx files have been copied to $output_dir."
