#! /usr/bin/env bash

vars_file="./vars.yml"

# Check whether it exists already
# Write the header
echo "---" > "$vars_file"

# Write the git e-mail address
read -p "E-mail address (git): " email_git
echo "email: $email_git" >> "$vars_file"

exit 0
