#!/bin/bash
NODE=$1
if [ -z "$NODE" ]; then
  echo "Usage: $0 <node-name>"
  exit 1
fi
kubectl delete node "$NODE"