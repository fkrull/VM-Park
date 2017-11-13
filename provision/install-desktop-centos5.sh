#!/bin/sh
yum groupinstall -y \
    "Administration Tools" \
    "Dialup Networking Support" \
    "Editors" \
    "GNOME Desktop Environment" \
    "Games and Entertainment" \
    "Graphical Internet" \
    "Graphics" \
    "Mail Server" \
    "Network Servers" \
    "Office/Productivity" \
    "Printing Support" \
    "Server Configuration Tools" \
    "Sound and Video" \
    "System Tools" \
    "Text-based Internet" \
    "Web Server" \
    "X Window System" \
    "Yum Utilities" \

sed -i "s/id:[0-9]:initdefault:/id:5:initdefault:/" /etc/inittab
sed -i "s/kernel \(.\+\)/kernel \\1 rhgb quiet/" /boot/grub/grub.conf
