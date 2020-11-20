#!/bin/sh
set -eu

RELEASE=$1

dnf -y upgrade --releasever=$RELEASE --nogpgcheck centos-gpg-keys centos-release centos-repos
dnf -y upgrade

# determine newest kernel
kernel=$(ls -1 /usr/lib/modules | sort --version-sort | tail -1)
dnf install -y gcc elfutils-devel kernel-devel-$kernel

# rebuild VBox guest additions modules
vbox_dir=$(ls /opt | grep VBoxGuestAdditions)
vbox_src_dir=$(ls /opt/${vbox_dir}/src | grep vboxguest)
make -C /opt/${vbox_dir}/src/${vbox_src_dir} KERN_VER=${kernel}
