#!/bin/sh
set -eu

RELEASE=$1

apt-get update
apt-get install -y apt-transport-https

cat > /etc/apt/sources.list <<EOF
deb https://deb.debian.org/debian/ ${RELEASE} main contrib
deb-src https://deb.debian.org/debian/ ${RELEASE} main contrib
EOF

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y dist-upgrade
apt-get -y --purge autoremove

# fix bootloader
grub-install /dev/sda

# determine newest kernel
kernel=$(ls -1 /lib/modules | sort --version-sort | tail -1)
apt-get -y install linux-headers-${kernel}

# rebuild VBox guest additions modules
vbox_dir=$(ls /opt | grep VBoxGuestAdditions)
vbox_src_dir=$(ls /opt/${vbox_dir}/src | grep vboxguest)
make -C /opt/${vbox_dir}/src/${vbox_src_dir} KERN_VER=${kernel} vboxsf
