#!/bin/sh -eu
yum groupinstall -y \
    "Base" \
    "Debugging Tools" \
    "Desktop" \
    "Desktop Debugging and Performance Tools" \
    "Directory Client" \
    "General Purpose Desktop" \
    "Hardware monitoring utilities" \
    "Input Methods" \
    "Internet Applications" \
    "Internet Browser" \
    "Java Platform" \
    "Legacy UNIX compatibility" \
    "Legacy X Window System compatibility" \
    "NFS file server" \
    "Network Infrastructure Server" \
    "Networking Tools" \
    "Office Suite and Productivity" \
    "Performance Tools" \
    "Print Server" \
    "Security Tools" \
    "Web Server" \
    "X Window System"

echo "id:5:initdefault:" > /etc/inittab
