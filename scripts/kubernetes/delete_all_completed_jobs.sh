#!/bin/bash
kubectl delete jobs --all --field-selector=status.successful=1