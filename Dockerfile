FROM scratch

LABEL org.opencontainers.image.source="https://github.com/fluxapps/flux-docker-utils"
LABEL maintainer="fluxlabs <support@fluxlabs.ch> (https://fluxlabs.ch)"

COPY . /flux-docker-utils

ARG COMMIT_SHA
LABEL org.opencontainers.image.revision="$COMMIT_SHA"
