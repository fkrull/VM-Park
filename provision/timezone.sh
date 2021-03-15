#!/bin/sh -eu
rm -rf /etc/localtime
ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
echo "$TIMEZONE" > /etc/timezone
