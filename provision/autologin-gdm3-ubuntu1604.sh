#!/bin/sh
mkdir -p /etc/gdm3
cat > /etc/gdm3/custom.conf <<EOF
[daemon]
AutomaticLogin=vagrant
AutomaticLoginEnable=True
EOF
