#!/bin/bash
set -ex
source lib.sh

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
