#!/bin/sh
apt-get update
apt-get -y install elementary-minimal elementary-standard elementary-desktop

# See
# http://bazaar.launchpad.net/~elementary-os/elementaryos/elementary-seeds.xenial/view/head:/blacklist
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
# could be removed by getting rid of CHILL, which nothing uses
gcc-2.95
# no one actually uses this anymore
#zephyr
# mdz, 2004-06-15: only pulled in by vim
ruby1.8

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

# we don't want Unity. Thanks.
unity
unity-2d
unity-greeter
# gnome-session is a config package, the binary is in gnome-session-bin
gnome-session
# we don't want Ubuntu branding as well
plymouth-theme-ubuntu-logo
branding-ubuntu
ubuntu-artwork
#ubiquity-ubuntu-artwork - it needs SOME artwork, we should provide one
ubiquity-slideshow-ubuntu
# including Ubuntu metapackages would be ridiculos
ubuntu-desktop
# totem recommends totem-mozilla, which recommends Firefox or Epiphany or virtual package that confuses Germinate
totem-mozilla
# make sure firefox, nautilus and banshee are not pulled in
firefox
nautilus
banshee
ubuntu-system-settings
compiz
gnome-system-monitor
example-content # creates ~/example.desktop
webbrowser-app # ubuntu web browser
overlay-scrollbar
gnome-screensaver
light-locker-settings
metacity
#uoa stuff
mcp-account-manager-uoa
libaccount-plugin-1.0-0
libsignon-extension1
libsignon-plugins-common1
libsignon-qt5-1
signon-plugin-password
signon-ui
signond
# unar pulls in gnustep-base resulting in gdomap running, lp:1357051
unar
gnome-user-guide
ubuntu-touch-sounds
marco # mate window manager
plymouth-theme-ubuntu-text
ubuntu-mono # icon theme
yelp
# fcitx-frontend-gtk3 causes input issues with misc elementary apps
fcitx-frontend-gtk3

# update-manager stuff
update-manager
update-manager-core
update-notifier
ubuntu-release-upgrader-core
ubuntu-release-upgrader-gtk

# stuff we don't want in stable
#apport-gtk
#apport-hooks-elementary
#apport-symptoms
#elementary-os-prerelease
EOF
)

for pkg in $blacklist; do
    apt-get autoremove --purge -f -y "$pkg"
done

cat > /etc/network/interfaces <<EOF
auto lo
iface lo inet loopback
EOF
