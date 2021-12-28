#!/usr/bin/env bash

systemctl --user -q is-active radio.service
 
if [ $? -eq 0 ]; then
    echo "radio toggled: radio.service is running, so turn radio turn OFF."
    systemctl --user stop radio.service
    exit 1
else
    echo "radio toggled: radio.service is not running, so turn radio turn ON."
    systemctl --user start radio.service
    exit 1
fi