#!/bin/sh -eu
export DEBIAN_FRONTEND=noninteractive
echo jackd2 jackd/tweak_rt_limits boolean true | debconf-set-selections
adduser vagrant audio
apt-get update
apt-get -y install \
    ubuntustudio-desktop \
    ubuntustudio-lowlatency-settings- \
    gnome-shell- \
    unity-greeter-
