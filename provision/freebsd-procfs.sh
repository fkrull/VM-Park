#!/bin/sh -eu
cat >> /etc/fstab <<EOF
proc	/proc	procfs	rw	0	0
EOF
