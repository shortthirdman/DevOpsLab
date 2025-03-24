#!/bin/bash

## Verify That the Deployment Was Successful
SERVICE="nginx"
if systemctl is-active --quiet $SERVICE; then
    echo "$SERVICE is running"
else
    echo "$SERVICE is NOT running. Restarting..."
    systemctl restart $SERVICE
fi