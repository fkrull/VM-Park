#!/bin/sh -eu
RELEASE=$1

dnf -y upgrade --releasever=$RELEASE --nogpgcheck centos-gpg-keys centos-release centos-repos
dnf -y upgrade

# rebuild VBox guest additions modules
dnf install -y gcc elfutils-devel kernel-devel
rcvboxadd quicksetup all
