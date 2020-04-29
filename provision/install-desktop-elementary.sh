#!/bin/sh
DIST=$(lsb_release -cs)
REPO=${1:-stable}

mkdir -p /etc/apt/sources.list.d
cat > /etc/apt/sources.list.d/elementary.list <<EOF
deb http://ppa.launchpad.net/elementary-os/${REPO}/ubuntu $DIST main
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
