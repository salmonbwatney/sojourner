# import libraries
from __future__ import print_function
from Tkinter import *
from PIL import Image
from PIL import ImageTk
import threading
import datetime
import imutils
import cv2
import time
import os
import sys
import time
import RPi.GPIO as gpio

# create new thread for picamera
class CameraThread:
    def __init__(self, vidStream, outputPath):
        # what this does:
        # store video stream and output path
        # initialize most recent frame
        # thread for reading and processing frams
        # thread stop event

        self.vidStream = vidStream
        self.outputPath = outputPath
        self.frame = None
        self.thread = None
        self.stopEvent = None

        # initialize Tkinter window and panel
        self.mainWindow = Tk()
        self.panel = None

        # initialize thread event
        self.stopEvent = threading.Event()
        thread = threading.Thread(target = self.run, args = ())
        thread.daemon = True    # daemonize thread
        thread.start()

        #set function callback for window close events
        self.mainWindow.wm_title("Sojourner GUI")
        self.mainWindow.wp_protocol("WM_DELETE_WINDOW", self.onClose)

    def run(self):
        # what you're about to witness is the laziest and messiest way to
        # deal with the Tkinter Runtime error that's thrown when Tkinter is
        # run as a threaded process
        try:
            #loop til we die
            while not self.stopEvent.is_set():
                self.frame = self.vidStream.read()
                self.frame = imutils.resize(self.frame, width = 300)

                # Convert from OpenCV BGR to PIL RGB to ImageTk format
                image = cv2.cvtColor(self.frame, cv2.COLOR_BGR2RB)
                image = Image.fromarray(image)
                image = ImageTk.PhotoImage(image)

                # if Tkinter panel no initialized, then initialize it
                if self.panel is None:
                    self.panel = Label(image = image)
                    self.panel.image = image
                    self.panel.grid(row = 2, column = 2, padx = 10, pady = 10)

                #if already initialized then update the panel
                else:
                    self.panel.configure(image = image)
                    self.panel.image = image

        except RuntimeError, e:
            print("[Console] A wild RuntimeError was caught!")

    #close method
    def onClose(self):
        # set stop event, clean everything up
        print("[Console] Stopping Camera...")
        self.stopEvent.set()
        self.vs.stop()
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

# video feed stuff
Label(mainWindow, text="Video Feed").grid(row=0, column=2)
cameraThread = CameraThread()


mainWindow.mainloop()
