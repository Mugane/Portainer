#!/bin/sh

# This script collates the individual .json templates in the ./templates folder into a single templates.json file
# The output is published by GitHub Actions to GitHub Pages at https://mugane.github.io/Portainer/templates.json
#
# To serve the templates.json file for use during local debugging, run:
# sudo docker run --name templates-json --rm -d -p 8080:80 -v ./templates.json:/usr/share/nginx/html/templates.json:ro nginx:alpine
# The template file URL will be http://172.17.0.1:8080/templates.json (not localhost - need to use the docker internal host IP)
#
# You'll also need to fire up the git server for the local template repo, "Git HTTP Server (Alpine)" and point that at the Portainer folder
# The git repo will be at http://172.17.0.1:8999 
#
# To keep templates.json updated, you will need to restart the container after running this collate script, so use:
# ./collate.sh --local && sudo docker restart templates-json

unlink ./templates.json 2>/dev/null # Quietly delete templates.json if it exists
printf "{\n  \"version\": \"2\",\n  \"templates\": [\n" > ./templates.json
for file in ./templates/*.json; do # Collate all the json files in ./templates separated by a comma
  sed -e 's/^/    /'  -e 's/\\n\\s*$//' "$file" >> ./templates.json # Add spaces for formatting, remove trailing space/newlines
  echo "," >> ./templates.json # Separate each joined template with a comma
done
sed -i '/,/{$d}' ./templates.json # Remove the last comma (and any trailing spaces)
printf "  ]\n}" >> ./templates.json # Close the json object collection
if [ "$1" = "--local" ]; then # If --local is passed, replace the URL with the local served url (otherwise it will pull from github)
  echo "Local collation detected... correcting ./templates.json"
  sed -i 's|https://github.com/Mugane/Portainer|http://172.17.0.1:8999/|g' ./templates.json
fi
echo "./templates/ concatenated successfully into ./templates.json"
