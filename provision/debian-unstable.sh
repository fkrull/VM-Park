#!/bin/sh
cat > /etc/apt/sources.list <<EOF
deb http://ftp.de.debian.org/debian/ unstable main
deb http://ftp.de.debian.org/debian/ unstable contrib
EOF

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -yy dist-upgrade
apt-get -y install linux-headers-amd64 virtualbox-guest-utils virtualbox-guest-x11 virtualbox-guest-dkms
