#!/bin/sh
cat >> /usr/share/misc/termcap <<EOF

putty-256color:\\
	:pa#32767:Co#256:tc=putty:
EOF
cap_mkdb /usr/share/misc/termcap
