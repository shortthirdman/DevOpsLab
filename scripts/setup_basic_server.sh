#!/bin/bash

# Update and upgrade the server
echo "Updating server packages..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Set the hostname
read -p "Enter the hostname for this server: " HOSTNAME
sudo hostnamectl set-hostname $HOSTNAME
echo "127.0.1.1 $HOSTNAME" | sudo tee -a /etc/hosts

# Set the timezone
read -p "Enter your timezone (e.g., 'America/New_York'): " TIMEZONE
sudo timedatectl set-timezone $TIMEZONE

echo "Server setup completed successfully!"