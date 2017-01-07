# import libraries
from Tkinter import *
from PIL import Image
from PIL import ImageTk
from __future__ import print_function
import subprocess
import time
import picamera
import picamera.array
import os
import sys
import time
import threading
import RPi.GPIO as gpio
import cv2
import cv2.cv as cv
import imutils
import datetime


# Camera Things
class CameraThread(object):
    # Separate thread for the camera object so it can run in the background
    def __init__(self, vidStream, outputPath):
        #store video stream object output path
        #start thread for reading frame and thread stop event
        self.vidStream = vidStream
        self.outputPath = outputPath
        self.frame = None
        self.thread = None
        self.stopEvent = None

        # init tkinter window and panel
        self.mainWindow = Tk()
        self.panel = None

        #initialize thread
        self.stopEvent = threading.Event()
        thread = threading.Thread(target=self.run, args=())
        thread.daemon = True    # daemonize thread
        thread.start()          # start thread

        #set callback function to handle window close events
        self.mainWindow.wm_title("Sojourner GUI")
        self.mainWindow.wm_protocol("WM_DELETE_WINDOW", self.onClose(

    def run(self):

        # Note: What you're about to witness is not only just messy
        # but the only way to get around a Tkinter Runtime error
        # that is only thrown when using a threaded process
        try:
            #loop until we die
            while not self.stopEvent.is_set():
                self.frame = self.vidStream.read()
                self.frame = imutils.resize(self.frame, width=300)

                # Switch from OpenCV's "BGR" mode to PIL's "RGB" mode
                # then format as ImageTk
                image = cv2.cvtcolor(self.frame, cv2.COLOR_BGR2RGB)
                image = Image.fromarray(image)
                image = ImageTk.PhotoImage(image)

                # Initialize Image Panel
                if self.panel is None:
                    self.panel = Label(image = image)
                    self.panel.image = image
                    self.panel.grid(row = 2, column = 2, padx = 10, pady = 10)

                # Update panel if already initialized
                else:
                    self.panel.configure(image = image)
                    self.panel.image = image

            #Runtime Error
        except RuntimeError, e:
            print("[Sojourner] Caught Runtime Exception")
    def onClose(self):
        # set stop event, stop camera and stop rest of process
        print("[Sojourner] Stopping Camera...")
        self.stopEvent.set()
        self.vidStream.stop()
        self.mainWindow.quit()

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
Label(mainWindow, text="Video Feed").grid(row=0, column=2)

def cameraDisplay():
    b,g,r = cv2.split(img)
    newImg = cv2.merge((r,g,b))
    newImgFromArray = Image.fromarray(newImg)
    global imgTkin
    imgTkin = ImageTk.PhotoImage(image=newImgFromArray)

    Label(mainWindow, image=imgTkin).grid(row=1, column=2)


cameraThread = CameraThread()
mainWindow.mainloop()
