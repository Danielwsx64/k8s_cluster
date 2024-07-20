#!/bin/sh

echo "$(./infra/helpers/app_name.sh):$(head mix.exs| sed -nE 's/.*version: "(.+)",/\1/pi')"
