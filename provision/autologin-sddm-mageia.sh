#!/bin/sh -eu
cat >> /etc/sddm.conf <<EOF
[Autologin]
User=vagrant
Session=01plasma.desktop
EOF
