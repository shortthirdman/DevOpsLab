#!/bin/bash

# Install pam_tally2 if not installed
sudo apt-get install libpam-modules -y

# Set lockout policy to lock user accounts after 5 failed attempts
echo "auth required pam_tally2.so onerr=fail deny=5" | sudo tee -a /etc/pam.d/common-auth

# Reset the failed login count for all users
sudo pam_tally2 --user * --reset