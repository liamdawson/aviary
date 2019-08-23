#!/usr/bin/env sh

set -eu

is_command() {
  command -v "$1" >/dev/null
}

if is_command apt-get; then
  sudo apt-get install -y git python3-pip
  is_command ansible || pip3 install --user ansible
elif is_command dnf; then
  sudo dnf install -y git python3-pip
  is_command ansible || pip3 install --user ansible
fi

