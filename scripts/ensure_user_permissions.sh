#!/bin/bash
# Set ownership and permissions for critical system files
sudo chown root:root /etc/passwd
sudo chmod 644 /etc/passwd
sudo chown root:root /etc/shadow
sudo chmod 600 /etc/shadow
# Verify changes
ls -l /etc/passwd /etc/shadow