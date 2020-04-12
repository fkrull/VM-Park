#!/bin/sh
set -eu

RELEASE=$1

dnf -y upgrade --releasever=$RELEASE --nogpgcheck fedora-gpg-keys fedora-release fedora-repos
# hack: sometimes dnf stops when importing the key for the first time, so we retry
dnf -y upgrade || dnf -y upgrade

vbox_dir=$(ls /opt | grep VBoxGuestAdditions)
/opt/${vbox_dir}/uninstall.sh
dnf install -y virtualbox-guest-additions
