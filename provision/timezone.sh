#!/bin/sh
rm -rf /etc/localtime
ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
