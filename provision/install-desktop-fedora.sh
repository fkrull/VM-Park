#!/bin/sh
dnf groupinstall -y "Fedora Workstation"
ln -sf /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target
