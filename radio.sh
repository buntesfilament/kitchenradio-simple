#!/usr/bin/env bash

mpv --network-timeout=120 --volume=100 --quiet --no-video https://stream.radiofrance.fr/fip/fip_hifi.m3u8\?id\=radiofrance &
sleep 14400 # 4h
sudo systemctl stop kitchenradio-fip.service
