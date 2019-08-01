#! /usr/bin/env bash

# Install ansible
ansible_path="$(which ansible)"
if [ "$ansible_path" != "" ]
then
    echo "Ansible is already installed"
else
    sudo ./scripts/setup_ansible.sh
fi

ansible-playbook playbook.yml --ask-become-pass

exit 0
