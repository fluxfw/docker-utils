#!/usr/bin/env sh

set -e

image="$1"
if [ -z "$image" ]; then
    echo "Please pass an image" >&2
    exit 1
fi

path_in_image="$2"
if [ -z "$path_in_image" ]; then
    echo "Please pass a path in image" >&2
    exit 1
fi

local_path="$3"
if [ -z "$local_path" ]; then
    echo "Please pass a local path" >&2
    exit 1
fi
if [ -d "$local_path" ] || [ -f "$local_path" ]; then
    echo "Please remove existing $local_path" >&2
    exit 1
fi

mkdir -p "`dirname "$local_path"`"

folder="/code/$local_path"

echo "Copy $path_in_image from $image to $local_path"
docker run --rm -it --network none -u "`id -u`":"`id -g`" -v "$PWD":"$folder" "$(echo -e "FROM alpine:latest\nCOPY --from=\"$image\" \"$path_in_image\" /copy-from-docker-image" | docker build - | awk '/Successfully built/{print $NF}')" cp -r /copy-from-docker-image "$folder/$local_path"
