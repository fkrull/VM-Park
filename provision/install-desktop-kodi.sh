#!/bin/sh
apt-get update
apt-get install -y software-properties-common
add-apt-repository ppa:team-xbmc/ppa
apt-get update
apt-get install -y kodi lightdm lightdm-gtk-greeter x11-xserver-utils

cat > /etc/X11/Xsession.d/99vboxclient-display <<EOF
VBoxClient --display
EOF
