#!/usr/bin/bash

DNF_CMD=$(which dnf)
APT_CMD=$(which apt)

if [[ ! -z $DNF_CMD ]]; then
    sudo dnf install ansible
elif [[ ! -z $APT_CMD ]]; then
    sudo apt update
    sudo apt install software-properties-common
#    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo add-apt-repository --yes --update -S 'deb https://ppa.launchpadcontent.net/ansible/ansible/ubuntu lunar main'
    sudo apt install ansible
else
    echo "Error: Unable to install Ansible"
    exit 1;
fi


