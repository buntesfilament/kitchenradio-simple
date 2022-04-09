#!/usr/bin/env bash

LED_DIR="/home/pi/kitchenradio-simple/"

echo "user = ${USER}"

function signal_led() {
    python ${LED_DIR}./led.py off
    sleep .2
    python ${LED_DIR}./led.py on
}

systemctl -q is-active radio.service

if [ $? -eq 0 ]; then
    echo "radio toggled: radio.service is running, so turn radio OFF."
    systemctl stop radio.service
    python ${LED_DIR}./led.py off

    # switch off again after 42 seconds to deal with impatient users
    sleep 42
    python ${LED_DIR}./led.py off

    exit 0
else
    python ${LED_DIR}./led.py on
    echo "radio toggled: radio.service is not running, so turn radio ON."
    systemctl start radio.service

    # wait and switch on the receiver (two attempts)
    sleep 8
    signal_led
    echo "as 5" | cec-client -s -d 1
    sleep 4
    signal_led
    echo "on 5" | cec-client -s -d 1
    sleep 8
    signal_led
    echo "as 5" | cec-client -s -d 1
    sleep 4
    signal_led
    echo "on 5" | cec-client -s -d 1
    signal_led

    exit 0
fi
