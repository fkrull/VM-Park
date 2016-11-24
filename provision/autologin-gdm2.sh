#!/bin/sh
cat > /etc/gdm/custom.conf <<EOF
[daemon]
AutomaticLogin=vagrant
AutomaticLoginEnable=True
EOF
