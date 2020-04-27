#!/bin/sh
yum update -y
amazon-linux-extras install epel mate-desktop1.x
yum install -y \
    lightdm \
    lightdm-gtk-greeter \
    xorg-x11-drv-evdev \
    xorg-x11-drv-keyboard \
    xorg-x11-drv-libinput \
    xorg-x11-drv-mouse \
    xorg-x11-drv-synaptics \
    xorg-x11-drv-vesa \
    xorg-x11-drv-vmmouse \
    xorg-x11-drv-vmware \
    xorg-x11-server-Xorg
