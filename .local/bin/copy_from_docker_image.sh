#!/usr/bin/env sh

set -e

mkdir -p "$3"
rm -rf "$3"

docker run --rm -it -u `id -u`:`id -g` -v "$PWD":/copy_from_docker_image_host -w /copy_from_docker_image_host --entrypoint cp "$(echo -e "FROM alpine:latest\nCOPY --from=\"$1\" \"$2\" /copy_from_docker_image" | docker build - --pull | awk '/Successfully built/{print $NF}')" -r /copy_from_docker_image "$3"
