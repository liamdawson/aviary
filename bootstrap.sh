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

if ! [ -f ~/.ssh/id_ed25519 ]; then
  ssh-keygen -t ed25519
  echo "Add the following as a deploy key (with write access)"
  cat ~/.ssh/id_ed25519.pub
  echo "at https://github.com/liamdawson/aviary/settings/keys"
fi

if ! [ -d ~/.aviary ]; then
  git clone git@github.com:/liamdawson/aviary.git ~/.aviary \
    --depth=1 \
    -c "user.email=liam@ldaws.com"
fi
