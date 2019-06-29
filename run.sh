#!/usr/bin/env sh

set -eu

if [ ! -d "${HOME}/.aviary" ]
then
  git clone git@github.com:/liamdawson/aviary "${HOME}/.aviary"
fi

cd "${HOME}/.aviary"

sudo -v
ansible-playbook -i "$(hostname -s) ansible_connection=local ansible_host=127.0.0.1," "$(hostname -s).yml"
