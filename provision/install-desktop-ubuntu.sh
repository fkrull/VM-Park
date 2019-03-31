#!/bin/sh
apt-get update
export DEBIAN_FRONTEND=noninteractive
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install ubuntu-desktop
apt-get install -f
