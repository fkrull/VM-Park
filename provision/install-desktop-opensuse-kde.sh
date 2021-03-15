#!/bin/sh -eu
zypper refresh
zypper --non-interactive install --auto-agree-with-licenses --recommends -t pattern \
    kde \
    kde_plasma

sed -i 's/^DISPLAYMANAGER=.*$/DISPLAYMANAGER="sddm"/' /etc/sysconfig/displaymanager
