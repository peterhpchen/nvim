#!/bin/sh

docker build --progress=plain -t sunnyvim .
docker run -v "$(pwd)":"/root/workspace" -it sunnyvim
