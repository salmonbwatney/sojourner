#import packages
from __future__ import print_function
from Tkinter import *
from PIL import Image
from PIL import ImageTk
import threading
import datetime
import imutils
import cv2
import os

# create new thread for picamera
class cameraThread:
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
        self.root = Tk()
        self.panel = None

        # initialize thread event
        self.stopEvent = threading.Event()
        thread = threading.Thread(target = self.run, args = ())
        thread.daemon = True    # daemonize thread
        thread.start()

        #set function callback for window close events
        self.root.wm_title("Sojourner GUI")
        self.root.wp_protocol("WM_DELETE_WINDOW", self.onClose)

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
        self.root.quit()
