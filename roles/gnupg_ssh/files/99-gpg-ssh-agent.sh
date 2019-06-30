#!/usr/bin/sh

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
systemctl --user import-environment SSH_AUTH_SOCK
