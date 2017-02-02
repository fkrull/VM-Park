#!/bin/sh
mkdir -p /etc/apt/sources.list.d
cat > /etc/apt/sources.list.d/neon.list <<EOF
deb http://archive.neon.kde.org/user xenial main
deb-src http://archive.neon.kde.org/user xenial main
EOF

apt-key adv --keyserver keyserver.ubuntu.com --recv 55751E5D

apt-get update
apt-get -y install neon-desktop