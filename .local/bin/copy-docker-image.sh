#!/usr/bin/env sh

set -e

from_image="$1"
if [ -z "$from_image" ]; then
    echo "Please pass a from image" >&2
    exit 1
fi

to_image="$2"
if [ -z "$to_image" ]; then
    echo "Please pass a to image" >&2
    exit 1
fi

#docker pull "$from_image" --all-tags

for tag in $(docker images "$from_image" | cut -d " " -f 4); do docker tag "$from_image:$tag" "$to_image:$tag"; done

#docker push "$to_image" --all-tags
