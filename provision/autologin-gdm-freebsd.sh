#!/bin/sh -eu
mkdir -p /usr/local/etc/gdm
cat > /usr/local/etc/gdm/custom.conf <<EOF
[daemon]
AutomaticLogin=vagrant
AutomaticLoginEnable=True
EOF
