#!/bin/sh

new_tab=$(./infra/helpers/image_name.sh $1)

docker tag $new_tab localhost:5001/$new_tab
docker push localhost:5001/$new_tab
