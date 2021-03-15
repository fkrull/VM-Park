#!/bin/sh -eu
cat > /etc/apt/apt.conf.d/99-allow-unauthenticated <<EOF
APT::Get::AllowUnauthenticated "true";
EOF
