#!/bin/sh

unlink ./templates.json
printf "{\n  \"version\": \"2\",\n  \"templates\": [\n" > ./templates.json
for file in ./templates/*.json; do # collate all the json files in ./templates separated by a comma
  sed -e 's/^/    /'  -e 's/\\n\\s*$//' "$file" >> ./templates.json # add spaces for formatting, remove trailing space/newlines
  echo "," >> ./templates.json # separate each template with a comma
done
sed -i -z '$s/..$//' ./templates.json # take off the last comma (and ignore the last newline character)
printf "\n  ]\n}" >> ./templates.json # close the json object collection
echo "./templates/ concatenated successfully into ./templates.json"