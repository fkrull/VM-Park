#!/bin/sh -eu
. /etc/os-release

curl -O https://tim.siosm.fr/downloads/siosm_gpg.pub
ostree remote add kinoite https://siosm.fr/kinoite/ --gpg-import siosm_gpg.pub
rm siosm_gpg.pub

flatpak uninstall --all --assumeyes

rpm-ostree cancel
rpm-ostree rebase kinoite:fedora/${VERSION_ID}/x86_64/kinoite
