#!/bin/bash

# Get latest mp3 in every Bounced Files directory and create a link

bounced_files_directories=$(find . -type d -name "Bounced Files")
bounces_directories=$(find . -type d -name "Bounces")
all_bounce_directories="$bounced_files_directories
$bounces_directories"

# Order all_bounce_directories randomly
all_bounce_directories=$(echo "$all_bounce_directories" | shuf)

IFS=$'\n'
for bounce_directory in $all_bounce_directories; do
    if ! latest_file=$(find "$bounce_directory" -type f -name "*.mp3" -o -name "*.wav" -exec stat -f "%B %N" {} + | sort -nr | head -1 |
        cut -c 12-); then
        echo "Error: $latest_file not found in $bounce_directory"
        continue
    fi
    
    echo "Playing: $latest_file"
    open "$latest_file"
    break
done

