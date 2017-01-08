#import packages
from __future__ import print_function
from roverCode import GuiThread
from imutils.video import VideoStream
import argparse
import time
import os
import sys
import RPi.GPIO as gpio


#create new argument parser & arguments
argParser = argparse.ArgumentParser()
argParser.add_argument("--science", required = True, help = "Science Storage Path")
argParser.add_argument("--picamera", type = int, default = -1, help = "Set value larger than 1 to use Picamera")
args = vars(argParser.parse_args())

# car setup
drivePin = 12  # attached to physical pin 12
steerPin = 11  # attached to physical pin 11

gpio.setmode(gpio.BOARD)        # Set GPIO board numbering mode
gpio.setup(drivePin, gpio.OUT)  # Set pin 12 as output
gpio.setup(steerPin, gpio.OUT)  # Set pin 11 as output

driveServo = gpio.PWM(drivePin, 50) # Enable PWM on pin 12
steerServo = gpio.PWM(steerPin, 50) # Enable PWM on pin 11

dutyCycleFwd = 10.0
dutyCycleRev = 55.0
dutyCycleLeft = 5.0
dutyCycleRight = 55.0
dutyCycleIdle = 100.0

def spinning_cursor():
    while True:
        for cursor in '|/-\\':
            yield cursor

spinner = spinning_cursor()

# start videostream, camera and the rest of the rover
os.system('cls')
print ("[NASA] Starting Sojourner Systems")
vidStream = VideoStream(usePiCamera=args["picamera"] > 0).start()
for _ in range(50):
    sys.stdout.write(spinner.next())
    sys.stdout.flush()
    time.sleep(0.05)
    sys.stdout.write('\b')
    sys.stdout.write('.')

# initialize servos
driveServo.start(dutyCycleIdle)
steerServo.start(dutyCycleIdle)

# driving functions
def driveFwd():
    driveServo.ChangeDutyCycle(dutyCycleFwd)

def driveRev():
    driveServo.ChangeDutyCycle(dutyCycleRev)

def turnLeft():
    steerServo.ChangeDutyCycle(dutyCycleLeft)

def turnRight():
    steerServo.ChangeDutyCycle(dutyCycleRight)

def rvrStop():
    driveServo.ChangeDutyCycle(dutyCycleIdle)

def steerStop():
    steerServo.ChangeDutyCycle(dutyCycleIdle)

def keydown(e):
    keyDown = e.char
    print(keyDown)

    if (keyDown == 'w' or keyDown == 'W'):
        print("moving forwards")
        driveFwd()

    if (keyDown == 's' or keyDown == 'S'):
        print("moving backwards")
        driveRev()

    if (keyDown == 'a' or keyDown == 'A'):
        print("turning left")
        turnLeft()

    if (keyDown == 'd' or keyDown == 'D'):
        print("turning right")
        turnRight()

    if (keyDown == 'b' or keyDown == 'B'):
        print("stopping car")
        rvrStop()

    if (keyDown == 'n' or keyDown == 'N'):
        print("stopping turn")
        steerStop()

gui = GuiThread(vidStream, args["science"])

gui.bind('<W>', keyDown)
gui.bind('<w>', keydown)

gui.bind('<A>', keydown)
gui.bind('<a>', keydown)

gui.bind('<S>', keydown)
gui.bind('<s>', keydown)

gui.bind('<D>', keydown)
gui.bind('<d>', keydown)

gui.bind('<B>', keydown)
gui.bind('<b>', keydown)

gui.bind('<N>', keydown)
gui.bind('<n>', keydown)

gui.root.mainloop()
