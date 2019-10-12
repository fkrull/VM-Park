#!/bin/sh
dnf upgrade -y rpm
dnf --exclude kernel groupinstall -y "Workstation"
