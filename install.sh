#! /usr/bin/env bash

# Install ansible
ansible_path="$(which ansible)"
if [ "$ansible_path" != "" ]
then
    echo "Ansible is already installed"
else
    sudo ./scripts/setup_ansible.sh
fi

# Create vars.yml file
vars_file="./vars.yml"
if [ -f "$vars_file" ]
then
    echo "$vars_file already exists"
else
    ./scripts/setup_vars.sh 
fi

# Run ansible
ansible-playbook playbook.yml --ask-sudo-pass

exit 0
