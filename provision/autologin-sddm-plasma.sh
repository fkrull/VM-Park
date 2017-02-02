#!/bin/sh
cat > /etc/sddm.conf <<EOF
[Autologin]
User=vagrant
Session=plasma.desktop
EOF
