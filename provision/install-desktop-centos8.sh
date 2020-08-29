#!/bin/sh
dnf upgrade -y rpm
dnf -y \
    --exclude "kernel,kernel-core,kernel-debug,kernel-debug-core,kernel-modules,kernel-modules-extras" \
    groupinstall "Workstation"
