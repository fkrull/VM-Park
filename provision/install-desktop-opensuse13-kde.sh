#!/bin/sh
zypper modifyrepo --disable distro-update-oss distro-update-non-oss
zypper refresh
zypper --non-interactive install --auto-agree-with-licenses -t pattern \
    kde
