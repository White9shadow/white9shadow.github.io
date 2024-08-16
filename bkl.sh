#!/data/data/com.termux/files/usr/bin/bash

# Base URL
base_url="https://retroarchemu.gitlab.io"

# Output file
output_file="output.html"

# Clear the output file or create a new one
> "$output_file"

# Loop through all .md and .html files in the current directory and subdirectories
find . -type f \( -name "*.md" -o -name "*.html" \) | while read -r file; do
    # Extract the relative file path without the leading ./
    relative_path="${file#./}"
    
    # Replace spaces with hyphens
    safe_path="${relative_path// /-}"
    
    # Remove the file extension
    file_name="${safe_path%.*}"
    
    # Convert file name to lowercase
    file_name_lower=$(echo "$file_name" | tr '[:upper:]' '[:lower:]')

    # Generate the full URL with a trailing slash
    file_url="$base_url/$file_name_lower/"

    # Append the HTML link to the output file
    echo "<a href=\"$file_url\">$file_name_lower</a>" >> "$output_file"
done

echo "Links have been generated and saved to $output_file."
