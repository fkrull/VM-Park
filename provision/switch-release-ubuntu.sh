#!/bin/sh
NEW=$1

cat > /etc/apt/apt.conf <<EOF
Dpkg::Options {
    "--force-confdef";
    "--force-confold";
};
EOF

CURRENT=$(lsb_release -cs)
sed -ie "s/${CURRENT}/${NEW}/g" /etc/apt/sources.list

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y dist-upgrade
dpkg --force-confdef --force-confold --configure -a
