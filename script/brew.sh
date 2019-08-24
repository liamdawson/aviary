#!/usr/bin/env sh

if ! (command -v curl > /dev/null || apt install curl -y || dnf install curl -y); then
  echo "Unable to find or install curl."
  exit 1
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
