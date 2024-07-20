#!/bin/sh

cluster_name="kind-$(./infra/helpers/app_name.sh | sed 's/_/-/' )"

kubectl cluster-info --context $cluster_name
