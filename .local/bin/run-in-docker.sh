#!/usr/bin/env sh

set -e

image="$1"
if [ -z "$image" ]; then
    echo "Please pass an image" >&2
    exit 1
fi
shift

entrypoint="$1"
if [ -z "$entrypoint" ]; then
    echo "Please pass an entrypoint" >&2
    exit 1
fi
shift

folder="/code/`basename "$PWD"`"

#docker pull "$image"
docker run --rm -it -u "`id -u`":"`id -g`" -v "$PWD":"$folder" -w "$folder" --entrypoint "$entrypoint" "$image" "$@"
