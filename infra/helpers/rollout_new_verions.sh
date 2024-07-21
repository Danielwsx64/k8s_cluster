#!/bin/sh

new_version=$(date +%s)
new_image="localhost:5001/$(./infra/helpers/image_name.sh $new_version)"

./infra/build_image.sh $new_version
./infra/helpers/push_image_to_local_registry.sh $new_version

kubectl set image -n k8-cluster deployment/k8-cluster-deployment k8-cluster=$new_image
