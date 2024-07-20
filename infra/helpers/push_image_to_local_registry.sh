#!/bin/sh

docker tag $(./infra/helpers/image_name.sh) localhost:5001/$(./infra/helpers/image_name.sh)
docker push localhost:5001/$(./infra/helpers/image_name.sh)
