#!/bin/sh
set -eu

RELEASE=$1

REMOTE=fedora
BRANCH=fedora/${RELEASE}/x86_64/silverblue

rpm-ostree cancel
rpm-ostree rebase ${REMOTE}:${BRANCH}
