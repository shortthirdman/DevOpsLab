#!/bin/bash
set -e

echo "Adding custom aliases..."

ALIAS_FILE="$HOME/.bash_aliases"
touch "$ALIAS_FILE"

declare -A aliases=(
  ["k"]="kubectl"
  ["tf"]="terraform"
  ["dc"]="docker compose"
  ["ll"]="ls -lah"
  ["gs"]="git status"
)

for alias in "${!aliases[@]}"; do
    if ! grep -q "alias $alias=" "$ALIAS_FILE"; then
        echo "alias $alias='${aliases[$alias]}'" >> "$ALIAS_FILE"
    fi
done

echo " Aliases added to ~/.bash_aliases"
echo "Run 'source ~/.bash_aliases' or restart your shell to use them."