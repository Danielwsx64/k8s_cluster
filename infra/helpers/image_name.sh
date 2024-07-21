#!/bin/sh

if [ -z "$1" ]; then
  # Get version from mix.ex file
  echo "$(./infra/helpers/app_name.sh):$(head mix.exs| sed -nE 's/.*version: "(.+)",/\1/pi')"
else
  # Use given version
  echo "$(./infra/helpers/app_name.sh):$1"
fi
