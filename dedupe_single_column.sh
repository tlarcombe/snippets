#!/bin/bash

# Check if input file is provided
if [ -z "$1" ]
  then
    echo "Usage: $0 input_file.csv"
    exit 1
fi

# Read input file and deduplicate based on seventh field (email)
sort -t , -u -k 7 "$1" -o "$1"

echo "Deduplication complete"
