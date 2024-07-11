#!/usr/bin/env sh

set -e

docker-utils-run-in-docker debian:latest bash . true "$@"
