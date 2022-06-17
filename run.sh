#!/bin/sh

docker build --progress=plain -t sunny .
docker run -v "$(pwd)":"/root/workspace" -it sunny
