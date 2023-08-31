#!/bin/bash

# https://github.com/devcontainers/features/blob/038bed3d58a84885da8a008b80905da17d57a543/src/node/install.sh#L66
apt_get_update() {
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# https://github.com/devcontainers/features/blob/038bed3d58a84885da8a008b80905da17d57a543/src/node/install.sh#L74
# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}
