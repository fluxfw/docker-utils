#!/usr/bin/env sh

set -e

image="$1"
if [ -z "$image" ]; then
    echo "Please pass an image"
    exit 1
fi

path_in_image="$2"
if [ -z "$path_in_image" ]; then
    echo "Please pass a path in image"
    exit 1
fi

local_path="$3"
if [ -z "$local_path" ]; then
    echo "Please pass a local path"
    exit 1
fi
if [ -d "$local_path" ] || [ -f "$local_path" ]; then
    echo "Please remove existing $local_path"
    exit 1
fi

mkdir -p "`dirname "$local_path"`"

echo "Copy $path_in_image from $image to $local_path"
"$(dirname "`realpath "$0"`")/run-in-docker.sh" "$(echo -e "FROM alpine:latest\nCOPY --from=\"$image\" \"$path_in_image\" /copy-from-docker-image" | docker build - --pull | awk '/Successfully built/{print $NF}')" cp -r /copy-from-docker-image "$local_path"
