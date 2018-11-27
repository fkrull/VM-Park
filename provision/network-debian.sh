#!/bin/sh
cat > /etc/network/interfaces <<EOF
auto lo
iface lo inet loopback
EOF
