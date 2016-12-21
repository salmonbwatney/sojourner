import RPi.GPIO as GPIO
import socket
import os
import sys
import network
import time

# Pin setup
sPin = 17 # Steering assigned to physical pin 11
dPin = 18 # Drive assigned to physical pin 12

# Duty Cycles
cycleFwd = 5.0
cycleRev = 55.0
cycleLeft = 45.0
cycleRight = 95.0
cycleIdle = 0.0

# Delay times
d_delay = 20 # Delay time for drive servo
s_delay = 50 # Delay time for steering servo

# GPIO Setup
GPIO.setmode(GPIO.BCM) # Set GPIO referencing numbers to Broadcom Pin Numbering
GPIO.setup(dPin, GPIO.OUT)
GPIO.setup(sPin, GPIO.OUT)
GPIO.cleanup()

# Servo Assignment
dServo = GPIO.PWM(dPin, 50)
stServo = GPIO.PWM(sPin, 50)

# Initialize Servo control
dServo.start(cycleIdle)
stServo.start(cycleIdle)

#Detect incoming commands
def heard(cmd):
    print("incoming command: " + cmd)
    for a in cmd:
        if a == "\r" or a == "\n":
            pass
        else:
            if (cmd == "mov_fwd"):
                dServo.ChangeDutyCycle(cycleFwd)
                time.sleep(d_delay)
            else:
                dServo.ChangeDutyCycle(cycleIdle)
                time.sleep(d_delay)

while True:
    print "awaiting connection"
    network.wait(whenHearCall = heard)
    print "connected"

    while network.isConnected():
        print "server is running"

    print "connection closed"

except KeyboardInterrupt:
    dServo.stop()
    stServo.stop()
    GPIO.cleanup()
