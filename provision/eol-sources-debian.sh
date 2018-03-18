#!/bin/sh
CODENAME=$(lsb_release -cs)
cat > /etc/apt/sources.list <<EOF
deb http://archive.debian.org/debian/ $CODENAME main non-free contrib
deb-src http://archive.debian.org/debian/ $CODENAME main non-free contrib

deb http://archive.debian.org/debian-security/ $CODENAME/updates main non-free contrib
deb-src http://archive.debian.org/debian-security/ $CODENAME/updates main non-free contrib
EOF
