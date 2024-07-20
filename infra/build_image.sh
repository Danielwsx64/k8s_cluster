#!/bin/sh

docker build . --tag $(./infra/helpers/image_name.sh)
