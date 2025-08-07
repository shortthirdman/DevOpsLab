#!/bin/bash
set -e

echo "Configuring Git..."

read -p "Enter your Git name: " name
read -p "Enter your Git email: " email

git config --global user.name "$name"
git config --global user.email "$email"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global color.ui auto

echo "Git configured."