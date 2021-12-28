#!/usr/bin/env bash

if (systemctl -q is-active radio.service); then
    echo "radio toggled: radio.service is running, so turn radio turn OFF."
    systemctl disable --now radio.service
    exit 1
else
    echo "radio toggled: radio.service is not running, so turn radio turn ON."
    systemctl enable --now radio.service
    exit 1
fi
