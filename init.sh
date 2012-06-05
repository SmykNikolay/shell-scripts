#!/bin/bash

# Generate random content
random_content=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)

# Create the file
file_name="random_script.sh"
touch "$file_name"

# Add random content to the file
echo "#!/bin/bash" >> "$file_name"
echo "echo \"$random_content\"" >> "$file_name"

# Make the file executable
chmod +x "$file_name"

# Add all changes
git add .

# Generate a random date between 2012-01-01 and 2024-04-05
random_date=$(date -v +$(( RANDOM % 4475 + 1))d -j -f "%Y-%m-%d" "2012-01-01" "+%Y-%m-%dT%H:%M:%S")

# Commit changes with the random date
GIT_AUTHOR_DATE="$random_date" GIT_COMMITTER_DATE="$random_date" git commit -m "Commit all changes"

echo "Script created and changes committed successfully!"