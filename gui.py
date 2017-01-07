#import packages
from __future__ import print_function
from Tkinter import *
from PIL import Image
from PIL import ImageTk
import threading
import datetime
import time
import imutils
import cv2
import os
import sys
import RPi.GPIO as gpio

#New Thread
class GuiThread:
    def servoVariables():
        drivePin = 12
        steerPin = 11

        dutyCycleFwd = 10.0
        dutyCycleRev = 55.0
        dutyCycleLeft = 5.0
        dutyCycleRight = 55.0
        dutyCycleIdle = 100.0

    #Keydown Events
    def keydown(e):
    keyDown = e.char
    print(keyDown)

    #Initialize Thread
    def __init__(self):
        self.vidStream = vidStream
        self.frame = None
        self.thread = None
        self.stopEvent = None

        #initialize tkinter
        self.root = Tk()
        self.panel = None

        #setup gpio
        gpio.setmode(gpio.BOARD)
        gpio.setup(drivePin, gpio.OUT)
        gpio.setup(steerPin, gpio.OUT)

        driveServo = gpio.PWM(drivePin, 50)
        steerServo = gpio.PWM(steerPin, 50)

        driveServo.start(dutyCycleStart)
        steerServo.start(dutyCycleStart)

        #initialize thread events
        self.stopEvent = threading.Event()
        thread = threading.Thread(target = self.run, args=())
        thread.daemon = True #daemonize thread
        thread.start()

        #function callback for window close event
        self.root.wm_title("sojourner gui")
        self.root.wp_protocol("WM_DELETE_WINDOW", self.onClose)


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


    def run(self):
        # very ugly way to deal with Tkinter runtime error thrown when
        # used as threaded process
        try:
            while not self.stopEvent.is_set():
                self.frame = self.vidStream.read()
                self.frame = imutils.resize(self.frame, width = 300)


                #convert from BGR to RGB to ImageTk
                image = cv2.cvtColor(self.frame, cv2.COLOR_BGR2RGB)
                image = Image.fromarray(image)
                image = ImageTk.PhotoImage(image)

                #if tkinter panel isn't initialized, start it.
                if self.panel is None:
                    self.panel = Label(image = image)
                    self.panel.image = image
                    self.panel.grid(row = 2, column = 2, padx = 10, pady = 10)

                #if already initialized, then update panel
                else:
                    self.panel.configure(image = image)
                    self.panel.image = image

                #rover controls
                if (keyDown == 'w' or key)

            except RuntimeError, e:
                print("[NASA] Tkinter RuntimeError was caught")
                print("[NASA] Maybe don't do that again...")
