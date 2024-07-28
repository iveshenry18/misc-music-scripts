#!/usr/env/bin bash

find . -name "*.mp3" | shuf -n 1 | xargs -I '{}' sh -c "echo 'Playing: {}' && open '{}'"
