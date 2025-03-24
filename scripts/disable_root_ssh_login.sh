#!/bin/bash

# Disable root login via SSH
sudo sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# Restart SSH service to apply changes
sudo systemctl restart sshd