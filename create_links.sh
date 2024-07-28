#!/usr/bin/env bash

# Get latest mp3 in every Bounced Files directory and create a link

bounced_files_directories=$(find .. -type d -name "Bounced Files")
bounces_directories=$(find .. -type d -name "Bounces")
echo "Bounced Files Directories: $bounced_files_directories"
echo "Bounces Directories: $bounces_directories"
all_bounce_directories="$bounced_files_directories
$bounces_directories"

IFS=$'\n'
for bounce_directory in $all_bounce_directories; do
    if ! latest_mp3=$(find "$bounce_directory" -type f -name "*.mp3" -exec stat -f "%B %N" {} + | sort -nr | head -1 |
cut -c 12-); then
        echo "Error: $latest_mp3 not found"
        continue
    fi

    echo "Creating link for $latest_mp3"
    ln -sf "$latest_mp3" .
done
