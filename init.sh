for i in {1..22375}; do
  # Generate random content
  random_content=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)

  # Create the file with a unique name
  i=$((i * (RANDOM % 4475 + 1)))
  file_name="random_script_$i.sh"
  touch "$file_name"

  # Add random content to the file
  echo "#!/bin/bash" >>"$file_name"
  echo "echo \"$random_content\"" >>"$file_name"

  # Make the file executable
  chmod +x "$file_name"

  git add .
  days=$((($(date +%s) - $(date -j -f "%Y-%m-%d" "2024-06-22" "+%s")) / 86400))

  random_date=$(date -v +$((RANDOM % days + 1))d -j -f "%Y-%m-%d" "2024-04-04" "+%Y-%m-%dT%H:%M:%S")

  # Commit changes with the random date
  GIT_AUTHOR_DATE="$random_date" GIT_COMMITTER_DATE="$random_date" git commit -m "Commit all changes"

  # If i is a multiple of 1000, push changes to the repository
  if ((i % 1000 == 0)); then
    git push
  fi

  echo "Script created and changes committed successfully!"
  echo "Random content: $random_content"
  echo "Commit date: $random_date"
done
