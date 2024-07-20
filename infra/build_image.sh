#!/bin/sh

docker build . --tag k8_cluster:$(head mix.exs| sed -nE 's/.*version: "(.+)",/\1/pi')
