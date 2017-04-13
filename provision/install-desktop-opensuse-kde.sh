#!/bin/sh
zypper refresh
zypper --non-interactive install --auto-agree-with-licenses -t pattern \
    kde \
    kde_plasma

sed -i 's/^DISPLAYMANAGER=.*$/DISPLAYMANAGER="sddm"/' /etc/sysconfig/displaymanager
