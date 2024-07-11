#!/usr/bin/env sh

set -e

docker-utils-run-in-docker alpine:latest sh . false "$@"
