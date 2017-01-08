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

    #Initialize Thread
    def __init__(self, vidStream, outputPath):
        self.vidStream = vidStream
        self.outputPath = outputPath
        self.frame = None
        self.thread = None
        self.stopEvent = None

        #initialize tkinter
        self.root = Tk()
        self.panel = None

        # create button that will allow us to take photos while driving.
        # just like a real rover
        captureScience = Button(self.root, text = "Get Science", command = self.grabScience)
        captureScience.grid(row = 3, column = 2, padx = 10, pady = 10)

        #initialize thread events
        self.stopEvent = threading.Event()
        thread = threading.Thread(target = self.run, args=())
        thread.daemon = True #daemonize thread
        thread.start()

        #function callback for window close event
        self.root.wm_title("sojourner gui")
        self.root.wp_protocol("WM_DELETE_WINDOW", self.onClose)


    def run(self):
        # very ugly way to deal with Tkinter runtime error thrown when
        # used as threaded process
        try:
            while not self.stopEvent.is_set():
                self.frame = self.vidStream.read()
                self.frame = cv2.flip(self.frame, -1) #Flip the camera because it's mounted upside down
                self.frame = imutils.resize(self.frame, width = 300)


                #convert from BGR to RGB to ImageTk
                image = cv2.cvtColor(self.frame, cv2.COLOR_BGR2RGB)
                image = Image.fromarray(image)
                image = ImageTk.PhotoImage(image)
                self.drivePin = 12 # attached to physical pin 12
                self.steerPin = 11 # attached to physical pin 11

                #rover controls
                gpio.setmode(gpio.BOARD)
                gpio.setup(self.drivePin, gpio.OUT)
                gpio.setup(self.steerPin, gpio.OUT)

                self.driveServo = gpio.PWM(self.drivePin, 50)
                self.steerServo = gpio.PWM(self.steerPin, 50)

                self.dutyCycleFwd = 10.0
                self.dutyCycleRev = 55.0
                self.dutyCycleLeft = 5.0
                self.dutyCycleRight = 55.0
                self.dutyCycleIdle = 100.0

                def keydown(self):
                    self.keyDown = self.char
                    print(self.keyDown)

                    if (keyDown == 'w' or keyDown == 'W'):
                        print("moving forwards")
                        self.driveServo.ChangeDutyCycle(self.dutyCycleFwd)

                    if (keyDown == 's' or keyDown == 'S'):
                        print("moving backwards")
                        self.driveServo.ChangeDutyCycle(self.dutyCycleRev)

                    if (keyDown == 'a' or keyDown == 'A'):
                        print("turning left")
                        self.steerServo.ChangeDutyCycle(self.dutyCycleLeft)

                    if (keyDown == 'd' or keyDown == 'D'):
                        print("turning right")
                        self.steerServo.ChangeDutyCycle(self.dutyCycleRight)

                    if (keyDown == 'b' or keyDown == 'B'):
                        print("stopping car")
                        self.driveServo.ChangeDutyCycle(self.dutyCycleIdle)

                    if (keyDown == 'n' or keyDown == 'N'):
                        print("stopping turn")
                        self.steerServo.ChangeDutyCycle(self.dutyCycleIdle)

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

                #if tkinter panel isn't initialized, start it.
                if self.panel is None:
                    self.panel = Label(image = image)
                    self.panel.image = image
                    self.panel.grid(row = 2, column = 2, padx = 10, pady = 10)

                #if already initialized, then update panel
                else:
                    self.panel.configure(image = image)
                    self.panel.image = image


        except RuntimeError, e:
            print("[NASA] Tkinter RuntimeError was caught")
            print("[NASA] Maybe don't do that again...")

    def grabScience(self):
        # get that science data (photo)
        # timestamp the file name
        # output path
        timeStamp = datetime.datetime.now()
        filename = "{}.jpg".format(timeStamp.strftime("%Y-%m-%d_%H-%M-%S"))
        path = os.path.sep.join((self.outputPath, filename))

        # save the file
        cv2.imwrite(path, self.frame.copy())
        print("[NASA] Science Data Recieved")

    def onClose(self):
        #stop event, cleanup camera, gpio and quit process
        print("[NASA] Halting Scientifc Study")
        self.stopEvent.set()
        self.vidStream.stop()
        self.root.quit()
        gpio.cleanup()
