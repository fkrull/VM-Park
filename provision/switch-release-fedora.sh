#!/bin/sh
RELEASE=$1
dnf upgrade -y --releasever=$RELEASE

vbox_dir=$(ls /opt | grep VBoxGuestAdditions)
/opt/${vbox_dir}/uninstall.sh
dnf install -y virtualbox-guest-additions
