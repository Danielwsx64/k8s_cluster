#!/bin/sh

if [ "$1" = "k8s" ]; then
  echo $(head mix.exs | sed -nE 's/.*app: :(.+),/\1/pi') | sed 's/_/-/'
else
  echo $(head mix.exs | sed -nE 's/.*app: :(.+),/\1/pi') 
fi
