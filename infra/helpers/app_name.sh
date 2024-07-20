#!/bin/sh

echo $(head mix.exs| sed -nE 's/.*app: :(.+),/\1/pi')
