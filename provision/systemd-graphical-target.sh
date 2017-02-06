#!/bin/sh
#ln -sf /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target
systemctl set-default graphical.target
