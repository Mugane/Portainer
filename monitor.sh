#!/bin/bash

# Script to monitor templates for json file changes and rebuild the templates.json file when detected (inotify/Linux)
# Run it once to set up monitoring. For windows, run monitor.ps1 in PowerShell (see README.md)

# Check if Docker can be run without "sudo". If your installation requires sudo, run this script using `sudo ./monitor.sh`:
if docker info >/dev/null 2>&1; then DOCKER="docker";
else DOCKER="sudo docker"; 
fi

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

# Check that the templates-json container is running and if not, start it:
if ! $DOCKER container inspect templates-json >/dev/null 2>&1; then
    $DOCKER run --name templates-json --rm -d -p 8080:80 -v "${PWD}/templates.json:/usr/share/nginx/html/templates.json:ro" nginx:alpine
fi

# Watch all the .json files and run the collation and restart docker every time one of them is saved:
while true; do #shellcheck disable=SC2034 # FILE appears unused but flags collation
    inotifywait -r -e modify,create,delete --format '%w%f' ./templates/*.json | while read -r FILE; do
        ./collate.sh --local && $DOCKER restart templates-json # Run collate script on every .json file change
        # ./collate.sh # Run collate script on every .json file change
    done
done

flock -u 200 # Unlock the script on exit
