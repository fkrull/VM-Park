#!/bin/sh -eu
DIST=$(lsb_release -cs)

mkdir -p /etc/apt/sources.list.d
cat > /etc/apt/sources.list.d/neon.list <<EOF
deb http://archive.neon.kde.org/user $DIST main
deb-src http://archive.neon.kde.org/user $DIST main
EOF

cat | debconf-set-selections <<EOF
encfs encfs/security-information note
EOF

apt-key adv --keyserver keyserver.ubuntu.com --recv 55751E5D

apt-get update
apt-get -y install neon-desktop
