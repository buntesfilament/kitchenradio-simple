import RPi.GPIO as GPIO
import time
import sys

# physical setup:
# - LED ground to a 330-470 Ohm resistor
# - LED + to GPIO-pin 18 (6th on outer row)
# - resistor to GPIO ground (3rd on outer row)

# usage:
# - run script: python "./led.py on" to switch on
# - run script: python "./led.py" to switch off

led_switch = GPIO.LOW
n = len(sys.argv)
print("n = " + str(n))
if n > 1:
    oo = sys.argv[1]
    print("oo = " + str(oo))
    if oo == "on":
        led_switch = GPIO.HIGH
        print "LED on"
    else:
        print "LED off"
else:
    print "LED off"

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(18, GPIO.OUT)
GPIO.output(18, led_switch)
