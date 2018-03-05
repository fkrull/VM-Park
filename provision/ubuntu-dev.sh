#!/bin/sh
cat > /etc/apt/apt.conf <<EOF
Dpkg::Options {
    "--force-confdef";
    "--force-confold";
};
EOF

CODENAME=$(lsb_release -cs)
sed -ie "s/${CODENAME}/devel/g" /etc/apt/sources.list

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y dist-upgrade
dpkg --force-confdef --force-confold --configure -a
