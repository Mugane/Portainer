#!/bin/bash

# Install inotify-tools if not already installed
if ! command -v inotifywait &> /dev/null; then
    if command -v yum &> /dev/null; then
        sudo yum install -y inotify-tools
    elif command -v apk &> /dev/null; then
        sudo apk add inotify-tools
    elif command -v apt &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y inotify-tools
    else
        echo "Unsupported package manager."
        exit 1
    fi
fi

# Lock the script using fcntl to prevent duplicate runs:
scriptname=$(basename "$0")
pidfile="/var/run/${scriptname}.pid"
exec 200>"$pidfile"
flock -n 200 || { echo "Another instance is already running."; exit 1; }

while true; do #shellcheck disable=SC2034 # FILE appears unused but flags collation
    inotifywait -r -e modify,create,delete --format '%w%f' ./templates/*.json | while read -r FILE; do
        ./collate.sh # Run collate script on every .json file change
    done
done

flock -u 200 # Unlock the script on exit