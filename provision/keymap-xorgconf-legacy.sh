#!/bin/sh
sed -i "s/\"XkbLayout\" \"[a-zA-Z]\+\"/\"XkbLayout\" \"$KEYMAP\"/" /etc/X11/xorg.conf
