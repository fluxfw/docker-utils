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

path="$1"
if [ -z "$path" ]; then
    echo "Please pass a path" >&2
    exit 1
fi
shift

path_host="`realpath "$path"`"
path_volume="/code/`basename "$path_host"`"

docker run --rm -it -u "`id -u`":"`id -g`" -v "$path_host":"$path_volume" -w "$path_volume" --entrypoint "$entrypoint" "$image" "$@"
