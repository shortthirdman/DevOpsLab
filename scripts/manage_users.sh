#!/bin/bash

# Create a new user
read -p "Enter the username to create: " USERNAME
sudo adduser $USERNAME

# Add the user to the sudo group 
sudo usermod -aG sudo $USERNAME

echo "User $USERNAME has been created and added to the sudo group."