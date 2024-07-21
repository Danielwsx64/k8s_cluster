#!/bin/sh

url=$(kubectl get services k8-cluster-service -n k8-cluster -o=jsonpath='http://{.status.loadBalancer.ingress[0].ip}:{.status.loadBalancer.ingress[0].ports[0].port}')

if [ $url != "http://:" ]; then
  open $url
else
  echo "You must start cloud-provider-kind and restart service k8-cluster-service"
fi

