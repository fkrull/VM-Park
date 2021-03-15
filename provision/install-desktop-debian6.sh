#!/bin/sh -eu
export DEBIAN_FRONTEND=noninteractive
apt-get update
tasksel install desktop
/etc/init.d/vboxadd-x11 setup
