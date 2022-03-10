#!/usr/bin/env sh

set -e

if [ -z `command -v install-project-to-home-local-bin` ]; then
    "`dirname "$0"`/../.local/bin/install-project-to-home-local-bin.sh" "`dirname "$0"`/.."
else
    install-project-to-home-local-bin "`dirname "$0"`/.."
fi
