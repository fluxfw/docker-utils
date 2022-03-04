#!/usr/bin/env sh

set -e

if [ -d "$3" ] || [ -f "$3" ]; then
  echo "$3 exists"
  exit 1
fi

mkdir -p "`dirname "$3"`"

docker run --rm -it -u `id -u`:`id -g` -v "$PWD":/copy-from-docker-image-host -w /copy-from-docker-image-host --entrypoint cp "$(echo -e "FROM alpine:latest\nCOPY --from=\"$1\" \"$2\" /copy-from-docker-image" | docker build - --pull | awk '/Successfully built/{print $NF}')" -r /copy-from-docker-image "$3"
