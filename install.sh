#!/bin/bash
set -ex

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

check_packages curl ca-certificates

arch=$(dpkg --print-architecture)

if [[ ${VERSION:-latest} == latest ]]; then
  # .../releases/latest redirects to /releases/tag/v1.2.3
  # https://stackoverflow.com/questions/58379142/grep-how-to-output-only-the-content-of-a-capturing-group
  VERSION=$(curl \
    -fsSL https://github.com/tinygo-org/tinygo/releases/latest \
    -w '%{url_effective}' -o /dev/null \
    | sed -nr 's/\/v(.*)$/\1/p')
fi

url="https://github.com/tinygo-org/tinygo/releases/download/v$VERSION/tinygo_${VERSION}_$arch.deb"

curl -fsSL "$url" -o tinygo.deb
dpkg -i tinygo.deb
rm tinygo.deb

# Clean up
rm -rf /var/lib/apt/lists/*
