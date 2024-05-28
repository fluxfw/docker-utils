#!/usr/bin/env sh

set -e

image="$1"
if [ -z "$image" ]; then
    echo "Please pass an image!" >&2
    exit 1
fi

path_in_image="$2"
if [ -z "$path_in_image" ]; then
    echo "Please pass a path in image!" >&2
    exit 1
fi

path="$3"
if [ -z "$path" ]; then
    echo "Please pass a path!" >&2
    exit 1
fi
if [ -e "$path" ]; then
    echo "Please remove existing $path!" >&2
    exit 1
fi

build_image="docker-utils-copy-from-docker-image"
build_tag="`date +%s`-$RANDOM"

path_host="`realpath "$path"`"
path_volume="/host"

echo "Copy $path_in_image from $image to $path_host"

echo -e "FROM alpine:latest\nCOPY --from=\"$image\" \"$path_in_image\" /copy-from-docker-image" | docker build - -t "$build_image:$build_tag"

docker run --rm -it --network none -u "`id -u`:`id -g`" -v "`dirname "$path_host"`:$path_volume" "$build_image:$build_tag" cp -r /copy-from-docker-image "$path_volume/`basename "$path_host"`"
