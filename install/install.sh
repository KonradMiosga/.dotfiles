#!/usr/bin/env bash

set -eo pipefail
IFS=$'\n\t'

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install Ansible on Arch Linux
install_ansible() {
    echo "Installing Ansible (Arch Linux)..."
    sudo pacman -Syu --noconfirm ansible
}

# Main installation process
main() {
    # Check if Ansible is installed
    if ! command_exists ansible; then
        install_ansible
    fi

    # Run the Ansible playbook
    echo "Running Ansible playbook..."
    ansible-playbook ansible-install.yml -v -K

    echo "Installation complete!"
    echo "Please log out and log back in for all changes to take effect."
}

main "$@"

