#!/bin/sh
groupadd -f nopasswdlogin
usermod -a -G nopasswdlogin vagrant
mkdir -p /etc/lightdm
cat > /etc/lightdm/lightdm.conf <<EOF
[Seat:*]
autologin-user=vagrant
autologin-timeout=0
[SeatDefaults]
autologin-user=vagrant
autologin-timeout=0
EOF
