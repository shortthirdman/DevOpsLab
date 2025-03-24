#!/bin/bash

# Install logrotate if not installed
sudo apt-get install logrotate -y

# Create a custom logrotate configuration file
echo "/var/log/*.log {
    daily
    rotate 7
    compress
    delaycompress
    missingok
    notifempty
    create 0640 root root
}" | sudo tee /etc/logrotate.d/custom_logs

# Test logrotate configuration
sudo logrotate --debug /etc/logrotate.conf