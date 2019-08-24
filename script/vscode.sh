#!/usr/bin/env sh

if command -v apt-get > /dev/null; then
  ansible -m apt_key -c local localhost -i "localhost," -a "url='https://packages.microsoft.com/keys/microsoft.asc'" --become
  ansible -m apt_repository -c local localhost -i "localhost," -a "repo='deb https://packages.microsoft.com/repos/vscode stable main'" --become
  sudo apt update
  ansible -m apt -c local localhost -i "localhost," -a "update_cache=yes name=code" --become
else
  echo "This script currently supports apt-based systems"
fi
