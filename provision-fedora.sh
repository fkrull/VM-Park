#!/bin/sh

localectl set-keymap de
echo "Europe/Berlin" > /etc/timezone

reboot
