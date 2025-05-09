#!/bin/bash
NAMESPACE=$1
BACKUP_DIR=${2:-"./k8s-backups"}
if [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <namespace> [backup-dir]"
  exit 1
fi
mkdir -p "$BACKUP_DIR"
kubectl get configmaps -n "$NAMESPACE" -o yaml > "$BACKUP_DIR/${NAMESPACE}_configmaps.yaml"
kubectl get secrets -n "$NAMESPACE" -o yaml > "$BACKUP_DIR/${NAMESPACE}_secrets.yaml"
echo "Backups saved to $BACKUP_DIR"