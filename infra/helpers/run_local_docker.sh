#!/bin/sh

docker run --rm -it --env-file='.env' -p 4000:4000 $(./infra/helpers/image_name.sh)
