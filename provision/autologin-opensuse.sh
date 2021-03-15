#!/bin/sh -eu
sed -i \
    '/DISPLAYMANAGER_AUTOLOGIN=".*"/c\DISPLAYMANAGER_AUTOLOGIN="vagrant"' \
    /etc/sysconfig/displaymanager
