#!/bin/sh -eu
VERSION=$(sed -e "s/[^0-9]*\([0-9.]\+\).*/\\1/" < /etc/redhat-release)
sed -i 's/mirrorlist/#mirrorlist/' /etc/yum.repos.d/*.repo
sed -i 's/#\(baseurl.*\)mirror.centos.org\/centos/\1vault.centos.org/' /etc/yum.repos.d/*.repo
sed -i "s/\$releasever/$VERSION/g" /etc/yum.repos.d/*.repo
