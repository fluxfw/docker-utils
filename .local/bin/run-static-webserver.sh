#!/usr/bin/env sh

set -e

listen_ip="$1"
if [ -z "$listen_ip" ]; then
    echo "Please pass a listen ip"
    exit 1
fi

xdg-open "http://$listen_ip"

docker run --rm -it -v "$PWD":/usr/share/nginx/html -p "$listen_ip:80:80" nginx:mainline-alpine
