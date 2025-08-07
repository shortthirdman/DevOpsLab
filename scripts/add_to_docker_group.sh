#!/bin/bash
set -e

echo "Adding user to Docker group..."
sudo usermod -aG docker "$(whoami)"

echo "You’ve been added to the Docker group."
echo " You may need to log out or run: newgrp docker"