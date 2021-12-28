#!/usr/bin/env bash

if (systemctl --user -q is-active radio.service); then
    echo "radio toggled: radio.service is running, so turn radio turn OFF."
    systemctl --user disable --now radio.service
    exit 1
else
    echo "radio toggled: radio.service is not running, so turn radio turn ON."
    systemctl --user enable --now radio.service
    exit 1
fi
