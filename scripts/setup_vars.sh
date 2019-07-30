#! /usr/bin/env bash

vars_file="./vars.yml"

# Check whether it exists already
# Write the header
echo "---" > "$vars_file"

# Get amd64 vs armhf
echo "arch: $(dpkg --print-architecture)" >> "$vars_file"

# Get the username
echo "user: $USER" >> "$vars_file"

# Whether we are in wsl or not
if [ "$(cat /proc/version | grep "Microsoft" | wc -l)" -eq 1 ]
then
    echo "wsl: true" >> "$vars_file"
else
    echo "wsl: false" >> "$vars_file"
fi

# Write the git e-mail address
read -p "E-mail address (git): " email_git
echo "email: $email_git" >> "$vars_file"

exit 0
