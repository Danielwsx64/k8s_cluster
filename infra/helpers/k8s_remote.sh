#!/bin/sh

if [ "$1" = "iex" ]; then
  kubectl exec --stdin --tty -n k8-cluster $(kubectl get pods -n k8-cluster -l app=k8-cluster -o name | head -n 1) -- bin/k8_cluster remote
else
  kubectl exec --stdin --tty -n k8-cluster $(kubectl get pods -n k8-cluster -l app=k8-cluster -o name | head -n 1) -- /bin/bash
fi
