#!/usr/bin/env sh

set -e

listen_ip="$1"
if [ -z "$listen_ip" ]; then
    echo "Please pass a listen ip" >&2
    exit 1
fi

xdg-open "http://$listen_ip"

docker run --rm -it -v "$PWD":/usr/share/nginx/html -p "$listen_ip:80:80" "$(echo -e "FROM nginx:mainline-alpine\nRUN sed -i 's/}/application\/javascript mjs;application\/manifest+json webmanifest;}/' /etc/nginx/mime.types" | docker build - --pull | awk '/Successfully built/{print $NF}')"
