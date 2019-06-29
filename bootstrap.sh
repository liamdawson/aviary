#!/usr/bin/env sh

set -eu

if command -v dnf >/dev/null
then
  sudo dnf install -y git python3-pip
  sudo pip3 install --user ansible
fi
