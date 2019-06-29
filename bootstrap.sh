#!/usr/bin/env sh

set -eu

if command -v dnf >/dev/null
then
  dnf install -y git python3-pip
  pip3 install --user ansible
fi
