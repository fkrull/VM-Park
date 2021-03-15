#!/bin/sh -eu
/etc/init.d/vboxadd-x11 setup
Xorg :1 -configure
mv $HOME/xorg.conf.new /etc/X11/xorg.conf
