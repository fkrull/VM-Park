#!/bin/sh
set -eu
echo PubkeyAcceptedKeyTypes +ssh-rsa > /etc/ssh/sshd_config.d/01-ssh-rsa.conf
