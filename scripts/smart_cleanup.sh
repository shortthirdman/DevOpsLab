#!/bin/bash

LOG="/var/log/cleanup.log"

echo "$(date) - Starting system cleanup" >> "$LOG"

sudo apt autoremove -y >> "$LOG" 2>&1
sudo apt autoclean -y >> "$LOG" 2>&1

echo "$(date) - Cleanup finished" >> "$LOG"