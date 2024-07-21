#!/bin/sh

kubectl_running=$(ps To command | grep kubectl | grep -v 'grep' | tr -d '\012\015')

if [ "$1" = "stop" ]; then
  pkill -t $(tty | sed 's/\/dev\///') kubectl
else
  if [ "$kubectl_running" != "" ]; then
    echo "There is a running kubectl command in this ttl. We cant run logs here"
  else
    for i in $(kubectl get pods -n k8-cluster -l app=k8-cluster -o=jsonpath='{.items[*].metadata.name}'); do
      kubectl logs -n k8-cluster $i -f&
    done
  fi
fi
