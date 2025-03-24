#!/bin/bash

# Enable UFW
sudo ufw enable

# Allow SSH (port 22) and HTTP (port 80)
sudo ufw allow 22
sudo ufw allow 80

# Deny all other incoming connections
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Show UFW status
sudo ufw status