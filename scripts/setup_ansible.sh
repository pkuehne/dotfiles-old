#! /usr/bin/env bash

if [ "$EUID" -ne 0 ]
then
    echo "Please re-run as root"
    exit 1
fi

apt-add-repository -y ppa:ansible/ansible
apt update
apt install -y software-properties-common
apt install -y ansible

exit 0
