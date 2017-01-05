#!/usr/bin/python3

# import libraries
from tkinter import *
from PIL import Image, ImageTk
import subprocess
import time
from picamera import PiCamera
import os
import sys
import time
import RPi.GPIO as gpio
import cv2
import cv2.cv as cv


#Create new tkinter window object
mainWindow = Tk()

#Create new picamera object
camera = PiCamera()

#Camera setup
camera.resoultion = (1920, 1080) #HD or nothing
camera.framerate = 15
camera.start_preview()


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

mainWindow.bind('<W>', keydown)
mainWindow.bind('<w>', keydown)

mainWindow.bind('<A>', keydown)
mainWindow.bind('<a>', keydown)

mainWindow.bind('<S>', keydown)
mainWindow.bind('<s>', keydown)

mainWindow.bind('<D>', keydown)
mainWindow.bind('<d>', keydown)

mainWindow.bind('<B>', keydown)
mainWindow.bind('<b>', keydown)

mainWindow.bind('<N>', keydown)
mainWindow.bind('<n>', keydown)

#The GUI Stuff actually starts here
Label(mainWindow, text "Video Feed").grid(row=0)
mainWindow.mainloop()
        
