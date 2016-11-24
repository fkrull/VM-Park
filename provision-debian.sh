#!/bin/sh
apt-get update
apt-get -yy dist-upgrade

localectl set-keymap de
echo "Europe/Berlin" > /etc/timezone

reboot
