#!/bin/sh

cluster_name="kind-$(./infra/helpers/app_name.sh k8s )"

kubectl cluster-info --context $cluster_name
