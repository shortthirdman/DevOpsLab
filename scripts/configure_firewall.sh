#!/bin/bash

# Enable the firewall
echo "Enabling UFW..."
sudo ufw enable

# Allow SSH and HTTP traffic
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

echo "Firewall has been configured!"
sudo ufw status