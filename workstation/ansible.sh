#!/usr/bin/bash

DNF_CMD=$(which dnf)
APT_CMD=$(which apt)

if [[ ! -z $DNF_CMD ]]; then
    sudo dnf install -y python3-pip
    python -m pip install --user ansible
 elif [[ ! -z $APT_CMD ]]; then
    sudo apt install -y python3-pip pipx
    pipx ensurepath
    pipx install ansible
    pipx ensurepath
    ln -s ~/.local/pipx/venvs/ansible/bin/ansible ~/.local/bin/ansible
    ln -s ~/.local/pipx/venvs/ansible/bin/ansible-config ~/.local/bin/ansible-config
    ln -s ~/.local/pipx/venvs/ansible/bin/ansible-connection ~/.local/bin/ansible-connection
    ln -s ~/.local/pipx/venvs/ansible/bin/ansible-console ~/.local/bin/ansible-console
    ln -s ~/.local/pipx/venvs/ansible/bin/ansible-doc ~/.local/bin/ansible-doc
    ln -s ~/.local/pipx/venvs/ansible/bin/ansible-galaxy ~/.local/bin/ansible-galaxy
    ln -s ~/.local/pipx/venvs/ansible/bin/ansible-playbook ~/.local/bin/ansible-playbook
    ln -s ~/.local/pipx/venvs/ansible/bin/ansible-pull ~/.local/bin/ansible-pull
    ln -s ~/.local/pipx/venvs/ansible/bin/ansible-test ~/.local/bin/ansible-test
    ln -s ~/.local/pipx/venvs/ansible/bin/ansible-vault ~/.local/bin/ansible-vault
else
    echo "Error: Unable to install Ansible via pip"
    exit 1;
fi


