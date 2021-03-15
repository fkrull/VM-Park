#!/bin/sh -eu
CODENAME=$(lsb_release -cs)

mkdir -p /etc/apt/sources.list.d/
cat > /etc/apt/sources.list.d/raspi.list <<EOF
deb http://archive.raspberrypi.org/debian/ $CODENAME main ui
#deb-src http://archive.raspberrypi.org/debian/ $CODENAME main ui
EOF

apt-get update
apt-get -yy install dirmngr
apt-key adv --keyserver keyserver.ubuntu.com --recv 7FA3303E
apt-get update

apt-get -yy install \
    raspberrypi-net-mods \
    raspberrypi-ui-mods \
    rpi-chromium-mods \

apt-get -yy --no-install-recommends install \
    lxde

apt-get -yy install \
    alacarte \
    arandr \
    claws-mail \
    claws-mail-i18n \
    debian-reference-en \
    pi-package \
    piclone \
    piserver \
    rpd-plym-splash \
    xpdf
