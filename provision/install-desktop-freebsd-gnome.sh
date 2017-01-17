#!/bin/sh
pkg install -y gnome3 xf86-input-keyboard xf86-input-mouse

cat > /etc/rc.conf.local <<EOF
dbus_enable="YES"
hald_enable="YES"
gdm_enable="YES"
gnome_enable="YES"
EOF
