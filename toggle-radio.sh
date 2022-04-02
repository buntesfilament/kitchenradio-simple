#!/usr/bin/env bash
echo $USER

systemctl -q is-active radio.service

if [ $? -eq 0 ]; then
    echo "radio toggled: radio.service is running, so turn radio turn OFF."
    systemctl stop radio.service
    exit 0
else
    echo "radio toggled: radio.service is not running, so turn radio turn ON."
    systemctl start radio.service
    sleep 8
    echo "as 5" | cec-client -s -d 1
    sleep 4
    echo "on 5" | cec-client -s -d 1
    exit 0
fi
