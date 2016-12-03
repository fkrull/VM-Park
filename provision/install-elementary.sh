#!/bin/sh
mkdir -p /etc/apt/sources.list.d
cat > /etc/apt/sources.list.d/elementary.list <<EOF
deb http://ppa.launchpad.net/elementary-os/stable/ubuntu xenial main
deb http://ppa.launchpad.net/elementary-os/os-patches/ubuntu xenial main
EOF

apt-key adv --keyserver keyserver.ubuntu.com --recv 4E1F8A59
apt-get update
export DEBIAN_FRONTEND=noninteractive
apt-get -y install elementary-minimal elementary-standard
apt-get -y dist-upgrade
