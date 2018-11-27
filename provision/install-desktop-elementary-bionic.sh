#!/bin/sh
DIST=bionic
mkdir -p /etc/apt/sources.list.d
cat > /etc/apt/sources.list.d/elementary.list <<EOF
deb http://ppa.launchpad.net/elementary-os/stable/ubuntu $DIST main
deb http://ppa.launchpad.net/elementary-os/os-patches/ubuntu $DIST main
deb http://packages.elementary.io/appcenter $DIST main
EOF

apt-key adv --keyserver keyserver.ubuntu.com --recv 4E1F8A59 FE70B91C
apt-get update
export DEBIAN_FRONTEND=noninteractive
apt-get -y install elementary-minimal elementary-standard elementary-desktop

# See
# https://bazaar.launchpad.net/~elementary-os/elementaryos/elementary-seeds.bionic/view/head:/blacklist
blacklist=$(grep -v '#' <<EOF
# blacklist: gnome1
# We want to avoid shipping GNOME 1.x components if possible
gconf
libxml
libcapplet
gnome-bin
gnome-libs

# blacklist: misc
# Packages which are pulled in incidentally (typically by build-dependencies)
# and could be trivially replaced with something that we ship

# java-common build-depends
#dpsyco
# various build-depends, pulls in lua, consider standarizing html->text
#elinks
# no one actually uses this anymore
#zephyr

# blacklist: security
#
# Packages which are not supportable from a security standpoint
#

## mdz: Packages noticed in 2004-06-14 review of germinate output
uw-imap
# We shall only ship current kernel-source
kernel-source-2.4.22
kernel-source-2.4.23
kernel-source-2.4.24
kernel-source-2.4.25
kernel-source-2.2.25
# results in lots of unwanted setuid-ness; modern stuff uses X or fb
svgalib
# we ship server software with TLS built-in
stunnel

# mdz, 2004-06-15
apache

## Packages which haven't shown up yet; make sure they don't sneak in

# mdz, 2004-06-14: many, many bugs and unmaintained (both debian and upstream)
metamail
# mdz, 2004-06-14: lots of unsafe string handling, CVE-2002-0789,
# CAN-2003-0436, CAN-2003-0437
mnogosearch
# mdz, 2004-06-14: requires no explanation
wu-ftpd
# mdz, 2004-06-14: CAN-2003-0781, unmaintained upstream, Debian#210444
ecartis
# mdz, 2004-06-14: lots of DoS and other badness, CAN-2003-0946, CAN-2004-0270,
# debian#209084
clamav
# mdz, 2004-06-14: upstream deliberately obfuscates vulnerabilities
# mdz, 2004-06-20: CAN-2002-0757, CAN-2003-0101, SNS 74, SNS 75
webmin

### elementary ###

apport
apport-gtk
apport-hooks-elementary
apport-symptoms
apt-transport-https
banshee
branding-ubuntu
compiz
# creates ~/example.desktop
example-content
fcitx-frontend-gtk3
firefox
# fonts superseded by fonts-noto or fonts-croscore
fonts-freefont-ttf
fonts-indic
fonts-khmeros-core
fonts-lao
fonts-liberation
fonts-lklug-sinhala
fonts-thai-tlwg
fonts-tibetan-machine
gnome-control-center
gnome-screensaver
# we only want gnome-session-bin not configs
gnome-session
gnome-software
gnome-system-monitor
gnome-user-guide
humanity-icon-theme
libaccount-plugin-1.0-0
libsignon-extension1
libsignon-plugins-common1
libsignon-qt5-1
light-locker-settings
# mate window manager
marco
mcp-account-manager-uoa
metacity
nautilus
overlay-scrollbar
plymouth-theme-ubuntu-logo
plymouth-theme-ubuntu-text
signon-plugin-password
signon-ui
signond
snapd
totem-mozilla
ubiquity-slideshow-ubuntu
ubuntu-artwork
ubuntu-desktop
ubuntu-release-upgrader-core
ubuntu-release-upgrader-gtk
ubuntu-system-settings
ubuntu-touch-sounds
# unar pulls in gnustep-base resulting in gdomap running, lp:1357051
unar
unity
unity-2d
unity-control-center
unity-greeter
update-manager
update-manager-core
update-notifier
# ubuntu web browser
webbrowser-app
# synaptics broke Dan's input
xserver-xorg-input-synaptics
yelp
#elementary-os-prerelease
EOF
)

for pkg in $blacklist; do
    apt-get autoremove --purge -f -y "$pkg"
done
