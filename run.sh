#!/usr/bin/env sh

set -eu

if [ ! -d "${HOME}/.aviary" ]
then
  git clone https://github.com/liamdawson/aviary.git "${HOME}/.aviary"
  cd "${HOME}/.aviary"
  git remote set-url origin git@github.com:/liamdawson/aviary.git
  git remote add anonymous https://github.com/liamdawson/aviary.git
fi

cd "${HOME}/.aviary"

if [ -x "/usr/bin/python3" ]; then
  python_path="/usr/bin/python3"
else
  python_path="/usr/bin/python"
fi

sudo -v
ansible-playbook \
  -i "$(hostname -s)," \
  -e "ansible_connection=local ansible_python_interpreter=${python_path}" \
     "src/$(hostname -s).yml" \
     $@
