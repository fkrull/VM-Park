#!/bin/sh
dnf -y \
    --exclude "kernel,kernel-core,kernel-debug,kernel-debug-core,kernel-modules,kernel-modules-extras" \
    --allowerasing \
    group install "Fedora Workstation"
