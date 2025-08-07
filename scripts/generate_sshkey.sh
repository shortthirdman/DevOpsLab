#!/bin/bash
set -e

echo "Generating SSH key..."

mkdir -p ~/.ssh
if [ -f ~/.ssh/id_ed25519 ]; then
    echo "SSH key already exists at ~/.ssh/id_ed25519. Aborting to avoid overwrite."
    exit 1
fi

read -p "Enter your email for SSH key: " email
ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N ""

if ! command -v xclip &> /dev/null; then
    sudo apt install -y xclip
fi

xclip -selection clipboard < ~/.ssh/id_ed25519.pub

echo "SSH key copied to clipboard. Paste it into GitHub/GitLab > SSH settings."