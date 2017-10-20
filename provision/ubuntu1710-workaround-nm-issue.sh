#!/bin/sh
apt-get update
apt-get -y install network-manager
systemctl start NetworkManager
