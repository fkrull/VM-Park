#!/bin/sh
cat >> /etc/default/console-setup <<EOF
XKBMODEL="pc105"
XKBLAYOUT="$KEYMAP"
EOF
