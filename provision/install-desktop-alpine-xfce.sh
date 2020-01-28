#!/bin/sh
apk add tzdata

setup-xorg-base xf86-video-vesa xf86-input-mouse xf86-input-keyboard

apk add lightdm lightdm-gtk-greeter xfce4 xfce4-terminal firefox-esr
rc-update add dbus
rc-update add lightdm
