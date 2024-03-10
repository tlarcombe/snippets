#!/bin/bash

# Define the input and output file names
input_file="your_input_file.csv"
output_file="output.csv"

# Use awk to process the CSV file
# -F, specifies the field separator as a comma
# NR>1 skips the header row
# !seen[$4] checks if the email address in the 4th column has been seen before
# If not, it prints the line and adds the email address to the seen array

awk -F, 'NR>1 && !seen[$4]++' "$input_file" > "$output_file"

# Replace the original file with the new one - acutall, comment this line out because it doesn't help

# mv "$output_file" "$input_file"

echo "Duplicate rows removed. Output file is ./output.csv."
