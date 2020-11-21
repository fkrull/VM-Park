#!/bin/sh
set -eu

RELEASE=$1

apt-get update
apt-get install -y apt-transport-https

cat > /etc/apt/sources.list <<EOF
deb https://deb.debian.org/debian/ ${RELEASE} main contrib
deb-src https://deb.debian.org/debian/ ${RELEASE} main contrib
EOF

cat | debconf-set-selections <<EOF
grub-pc grub-pc/install_devices multiselect /dev/sda
EOF

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y dist-upgrade || apt-get -y dist-upgrade
apt-get -y --purge autoremove


# rebuild VBox guest additions modules
apt-get -y install linux-headers-amd64 build-essential
rcvboxadd quicksetup all
