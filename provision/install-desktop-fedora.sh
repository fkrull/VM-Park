#!/bin/sh
dnf --exclude kernel,kernel-core,kernel-modules,kernel-modules-extra -y \
    --allowerasing \
    group install "Fedora Workstation"
systemctl enable gdm
