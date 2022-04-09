import RPi.GPIO as GPIO
import time
import sys

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
