#!/bin/sh
yum --exclude kernel,kmod-kvdo,vdo groupinstall -y \
    "GNOME Desktop" \
    "Backup Client" \
    "GNOME Applications" \
    "Internet Applications" \
    "Office Suite and Productivity"
