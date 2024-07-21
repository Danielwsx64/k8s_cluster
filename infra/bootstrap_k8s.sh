#!/bin/sh

./infra/helpers/kind_with_local_registry.sh
./infra/helpers/kubectl_info.sh
./infra/build_image.sh
./infra/helpers/push_image_to_local_registry.sh

kubectl apply -f ./infra/k8s/namespace.yml
kubectl apply -f ./infra/k8s/secret.yml
kubectl apply -f ./infra/k8s/deployment.yml
kubectl apply -f ./infra/k8s/service.yml
