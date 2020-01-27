#!/bin/sh
mkdir -p /usr/local/etc/xdg/autostart/
cat > /usr/local/etc/xdg/autostart/keymap.desktop <<EOF
[Desktop Entry]
Name=setkeymap $KEYMAP
Exec=setxkbmap $KEYMAP
Type=Application
EOF
