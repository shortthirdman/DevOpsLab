#!/bin/bash

# Find SUID and SGID files
echo "Finding SUID and SGID files..."
find / -type f -executable -perm /4000 -o -perm /2000

# Optionally remove them (comment this line if you don't want to delete files)
find / -type f -executable -perm /4000 -o -perm /2000 -exec rm -f {} \;