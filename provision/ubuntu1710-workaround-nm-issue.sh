#!/bin/sh -eu
apt-get update
apt-get -y install network-manager
systemctl start NetworkManager
