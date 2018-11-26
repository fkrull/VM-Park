#!/bin/sh
mkdir -p /etc/gdm3
tee /etc/gdm3/custom.conf /etc/gdm3/daemon.conf <<EOF
[daemon]
AutomaticLogin=vagrant
AutomaticLoginEnable=True
EOF
