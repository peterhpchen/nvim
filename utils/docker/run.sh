#!/bin/sh

docker build --no-cache --progress=plain -t nvim .
docker run -v "$(pwd)":"/root/workspace" -it nvim
