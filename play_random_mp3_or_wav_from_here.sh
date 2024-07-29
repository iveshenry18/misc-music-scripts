#!/bin/bash

file=$(find . -name "*.mp3" -o -name "*.wav" -print0 | shuf -n 1 -z | xargs -0 readlink -f)

if [ -n "$file" ]; then
    echo "Playing: $file"
    open "$file"
else
    echo "No MP3 or WAV files found."
fi
