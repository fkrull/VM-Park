#!/bin/sh
zypper refresh
zypper --non-interactive install --auto-agree-with-licenses -t pattern \
    kde \
    kde_plasma
