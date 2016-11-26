#!/bin/sh
sed -i \
    '/DISPLAYMANAGER_AUTOLOGIN=".*"/c\DISPLAYMANAGR_AUTOLOGIN="vagrant"' \
    /etc/sysconfig/displaymanager
