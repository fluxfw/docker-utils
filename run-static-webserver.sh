#!/usr/bin/env sh

set -e

path="$1"
if [ -z "$path" ]; then
    echo Please pass a path! >&2
    exit 1
fi

listen_ip="$2"
if [ -z "$listen_ip" ]; then
    echo Please pass a listen ip! >&2
    exit 1
fi

image=docker-utils-run-static-webserver:latest

path_host="`realpath "$path"`"
path_volume=/usr/share/nginx/html

echo -e "FROM nginx:mainline-alpine\nRUN sed -i 's/}/application\/javascript mjs;application\/manifest+json webmanifest;}/' /etc/nginx/mime.types" | docker build - --pull -t "$image"

xdg-open "http://$listen_ip"

docker run --rm -it -v "$path_host:$path_volume" -p "$listen_ip:80:80" "$image"
