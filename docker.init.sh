#!/bin/bash

if ! command -v docker-compose &> /dev/null; then
  echo "docker-compose is not installed"
  exit 1
fi

# Array of directories containing Nginx configuration files
CONFIG_DIRS=(
  "./nginx/vhost"
  "./nginx/params"
)

# Remove .off suffix from all files
for dir in "${CONFIG_DIRS[@]}"; do
  for file in "$dir"/*.off; do
    if [ -f "$file" ]; then
      mv "$file" "${file%.off}"
      printf "\tRevert\t$file\t\t\t=>\t\t${file%.off}\r\n"
    fi
  done
done

printf "\r\n\r\n";

# Iterate over each directory in the array
for dir in "${CONFIG_DIRS[@]}"; do
  # Iterate over all .conf files in the directory
  for file in "$dir"/*.conf; do
    # Extract the root parameter
    root_dir=$(grep -oP 'root\s+\K\S+' "$file")

    # Check if the root directory exists
    if [ ! -d "$root_dir" ]; then
      # Rename the file with a .off suffix
      mv "$file" "$file.off"
      printf "\tRenamed\t$file\t\t\t=>\t\t$file.off\r\n"
    fi
  done
done

cd /srv/config && docker-compose stop && docker-compose down && docker-compose up --build --detach --force-recreate;