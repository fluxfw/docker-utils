#!/usr/bin/env sh

set -e

image="$1"
if [ -z "$image" ]; then
    echo "Please pass an image"
    exit 1
fi
shift

entrypoint="$1"
if [ -z "$entrypoint" ]; then
    echo "Please pass an entrypoint"
    exit 1
fi
shift

#docker pull "$image"

folder=`basename "$PWD"`
docker run --rm -it -u `id -u`:`id -g` -v "$PWD":"/code/$folder" -w "/code/$folder" $(printenv | grep "FLUX_" | cut -f1 -d= | sed 's/^/-e /') --entrypoint "$entrypoint" "$image" "$@"
