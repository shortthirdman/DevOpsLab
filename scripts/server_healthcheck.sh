#!/bin/bash

echo "Checking server health..."

# CPU usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}'

# Memory usage
echo "Memory Usage:"
free -h

# Disk usage
echo "Disk Usage:"
df -h

echo "Health check completed!"