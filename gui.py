'''
    Copyright 2017 - Samantha Rachel Belnavis, Some Rights Reserved

    Licensed under the GNU General Public License, Version 3.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.gnu.org/licenses/gpl.html

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for specific language governing permissions and
    limitations under the License.

    Program Created by: 	Samantha Rachel Belnavis
    Date Created:		January 7, 2017
    Date Last Modified: 	April 19, 2017
    File Name: 		        gui.py
    File Description: 		Python GUI
'''

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
argParser.add_argument("--science", required=True, help="Science Storage Path")
argParser.add_argument("--picamera", type=int, default=-1, help="Set value larger than 1 to use Picamera")
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

# spinning cursor for that console aesthetic
def spinning_cursor():
    while True:
        for cursor in '|/-\\':
            yield cursor

spinner = spinning_cursor()

# start videostream, camera and the rest of the rover
os.system('clear')
print ("[NASA] Starting Sojourner Systems")
vidStream = VideoStream(usePiCamera=args["picamera"] > 0).start() # start video stream
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

    if (keyDown == 'w'):
        print("moving forwards")
        driveFwd()

    if (keyDown == 's'):
        print("moving backwards")
        driveRev()

    if (keyDown == 'a'):
        print("turning left")
        turnLeft()

    if (keyDown == 'd'):
        print("turning right")
        turnRight()

    if (keyDown == 'b'):
        print("stopping car")
        rvrStop()

    if (keyDown == 'n'):
        print("stopping turn")
        steerStop()

gui = GuiThread(vidStream, args["science"])

gui.root.bind('<w>', keydown)
gui.root.bind('<a>', keydown)
gui.root.bind('<s>', keydown)
gui.root.bind('<d>', keydown)
gui.root.bind('<b>', keydown)
gui.root.bind('<n>', keydown)

gui.root.mainloop()
