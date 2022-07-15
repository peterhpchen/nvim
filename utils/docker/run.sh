#!/bin/sh

docker build --progress=plain -t nvim .
docker run -v "$(pwd)":"/root/workspace" -it nvim
