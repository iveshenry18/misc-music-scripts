#!/usr/env/bin bash

find . -name "*.mp3" -o -name "*.wav" | shuf -n 1 | xargs -I '[]' readlink -f '[]' | xargs -I '{}' sh -c 'echo "Playing: {}" && open "{}"'
