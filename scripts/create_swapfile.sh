#!/bin/bash

# Create a 2GB swap file
echo "Creating a 2GB swap file..."
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# Persist swap file across reboots
echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab

echo "Swap file created successfully!"