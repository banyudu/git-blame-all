#!/bin/bash

# Check if a filename was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

# Loop through each line of the given file and run git blame
line_number=1
while read line; do
  commit_sha=$(git blame -L $line_number,$line_number "$1" | cut -c -8)
  echo "$commit_sha" : "$line"
  line_number=$((line_number + 1))
done <"$1"
