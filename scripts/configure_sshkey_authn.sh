#!/bin/bash

# Set up SSH key authentication
read -p "Enter the username: " USERNAME
sudo mkdir -p /home/$USERNAME/.ssh
sudo chmod 700 /home/$USERNAME/.ssh

echo "Paste your public SSH key below:"
read SSH_KEY 
echo $SSH_KEY | sudo tee /home/$USERNAME/.ssh/authorized_keys

sudo chmod 600 /home/$USERNAME/.ssh/authorized_keys
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

echo "SSH key-based authentication configured for $USERNAME."