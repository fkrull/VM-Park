#!/bin/sh
dnf --exclude kernel,kernel-core,kernel-modules,kernel-modules-extra -y \
    group install --best --allowerasing "MATE Desktop"
