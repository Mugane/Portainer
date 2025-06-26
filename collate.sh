#!/bin/sh

# This script collates the individual .json templates in the ./templates folder into a single templates.json file
# The output is published by GitHub Actions to GitHub Pages at https://mugane.github.io/Portainer/templates.json

unlink ./templates.json 2>/dev/null # Quietly delete templates.json if it exists
printf "{\n  \"version\": \"2\",\n  \"templates\": [\n" > ./templates.json
for file in ./templates/*.json; do # Collate all the json files in ./templates separated by a comma
  sed -e 's/^/    /'  -e 's/\\n\\s*$//' "$file" >> ./templates.json # Add spaces for formatting, remove trailing space/newlines
  echo "," >> ./templates.json # Separate each joined template with a comma
done
sed -i '/,/{$d}' ./templates.json # Remove the last comma (and any trailing spaces)
# printf "}\n  ]\n}" >> ./templates.json # Close the json object collection
printf "  ]\n}" >> ./templates.json # Close the json object collection
echo "./templates/ concatenated successfully into ./templates.json"
