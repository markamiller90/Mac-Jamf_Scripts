#!/bin/bash

# Script to add a user to sudoers.d using Jamf

# Variables
username="$3" # Get the username from Jamf parameter 3
echo $username
sudoers_file="/etc/sudoers.d/$username" # Create a file with the username in sudoers.d

# Check if username is provided
if [ -z "$username" ]; then
  echo "Error: Username not provided."
  exit 1
fi

# Check if the user already has a sudoers file
if [ -f "$sudoers_file" ]; then
  echo "User $username already has a sudoers configuration."
  exit 0 # Exit cleanly, as the user already has a file.
fi

# Create the sudoers file with desired permissions. Example grants all sudo permissions.
echo "$username ALL=(ALL) ALL" > "$sudoers_file"

# Set correct permissions
chmod 0440 "$sudoers_file"

# Check if file creation was successful
if [ -f "$sudoers_file" ]; then
    echo "Successfully added $username to sudoers.d"
    exit 0
else
    echo "Error: Failed to create sudoers file for $username"
    exit 1
fi