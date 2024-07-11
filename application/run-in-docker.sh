#!/usr/bin/env sh

set -e

image="$1"
if [ -z "$image" ]; then
    echo Please pass an image! >&2
    exit 1
fi
shift

entrypoint="$1"
if [ -z "$entrypoint" ]; then
    echo Please pass an entrypoint! >&2
    exit 1
fi
shift

path="$1"
if [ -z "$path" ]; then
    echo Please pass a path! >&2
    exit 1
fi
shift

as_root="$1"
if [ "$as_root" != true ] && [ "$as_root" != false ]; then
    echo Please pass as-root! >&2
    exit 1
fi
shift

path_host="`realpath "$path"`"
path_volume="/host/`basename "$path_host"`"

docker run --rm -it $(if [ "$as_root" = false ]; then echo -u "`id -u`:`id -g`"; fi) -v "$path_host:$path_volume" -w "$path_volume" --entrypoint "$entrypoint" "$image" "$@"
