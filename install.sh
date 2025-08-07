#!/bin/bash
set -e
echo " Running DevOps bootstrap scripts..."
for script in setup/*.sh; do
    echo "Running $script"
    bash "$script"
done
echo " All scripts completed successfully."