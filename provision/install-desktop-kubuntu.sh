#!/bin/sh
cat | debconf-set-selections <<EOF
encfs encfs/security-information note
EOF

apt-get update
apt-get -y install kubuntu-desktop
