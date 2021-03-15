#!/bin/sh -eu
mkdir -p /etc/gdm
cat > /etc/gdm/custom.conf <<EOF
[daemon]
AutomaticLogin=vagrant
AutomaticLoginEnable=True
EOF
