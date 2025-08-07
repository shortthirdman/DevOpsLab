#!/bin/bash

# Install Certbot
echo "Installing Certbot..."
sudo apt-get install -y certbot python3-certbot-nginx

# Obtain and install an SSL certificate
read -p "Enter your domain name (e.g., example.com): " DOMAIN
sudo certbot --nginx -d $DOMAIN

echo "SSL certificate installed for $DOMAIN!"