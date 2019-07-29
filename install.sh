#! /usr/bin/env bash

ansible_path="$(which ansible)"
if [ "$ansible_path" != "" ]
then
    echo "Ansible is already installed"
else
    sudo ./scripts/setup_ansible.sh
fi

vars_file="./vars.yml"
if [ -f "$vars_file" ]
then
    echo "$vars_file already exists"
else
    ./scripts/setup_vars.sh 
fi

exit 0
