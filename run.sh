#!/usr/bin/env sh

set -eu

if [ ! -d "${HOME}/.aviary" ]
then
  git clone https://github.com/liamdawson/aviary.git "${HOME}/.aviary"
  cd "${HOME}/.aviary"
  git remote set-url origin git@github.com:/liamdawson/aviary.git
  git remote add anonymous git@github.com:/liamdawson/aviary.git
fi

cd "${HOME}/.aviary"

sudo -v
ansible-playbook -i "$(hostname -s) ansible_connection=local ansible_host=127.0.0.1," "$(hostname -s).yml"
