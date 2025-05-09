#!/bin/bash
DEPLOYMENT=$1
NAMESPACE=$2
if [ -z "$DEPLOYMENT" ] || [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <deployment> <namespace>"
  exit 1
fi
kubectl rollout status deployment/"$DEPLOYMENT" -n "$NAMESPACE"