# Readme: kitchenradio-simple

## Install

- Make sure php8.2 with Apache2 and mpv are already working on your system.
- Do not use this in production environments reachable from the internet!
- We recommend using it only behind a NAT/Router on a RaspberryPi.

```
cd /home/pi/gits  # and clone here
cp ./config/systemd/system/kitchenradio-fip.service /etc/systemd/system/.
chmod u+x ./radio.sh
cp php/fip* /var/www/html/.
```

- create a sudoers-entry with `sudo visudo` to allow www-data (in case of Apache2) execute the kitchenradio-fip.service

```
www-data ALL=(ALL) NOPASSWD: /bin/systemctl start kitchenradio-fip.service, /bin/systemctl stop kitchenradio-fip.service
```

## Usage

```.sh
curl http://yourserver/fipon.php
```

- Now you can call this from any other device (browser) or integrate it to HomeAssistant or iOS shortcuts ("Get contents of <URL>").

## Deprecations

- led.py
- toggle-radio.sh
