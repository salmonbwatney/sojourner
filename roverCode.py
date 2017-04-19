'''
    Copyright 2017 Samantha Rachel Belnavis, Some Rights Reserved

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
    File Name: 		        roverCode.py
    File Description: 		Rover Control Code
'''
#import packages
from __future__ import print_function
from PIL import Image
from PIL import ImageTk
import Tkinter
import threading
import datetime
import time
import imutils
import cv2
import os
import sys

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
        self.root.wm_protocol("WM_DELETE_WINDOW", self.onClose)


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

                #if tkinter panel isn't initialized, start it.
                if self.panel is None:
                    self.panel = Label(image = image)
                    self.panel.image = image
                    self.panel.grid(row=2, column=2, padx=10, pady=10)

                #if already initialized, then update panel
                else:
                    self.panel.configure(image=image)
                    self.panel.image = image


        except RuntimeError, e:
            print("[NASA] Tkinter RuntimeError was caught")
            print("[NASA] Maybe don't do that again...")
            print("[NASA] Detailed Error Below: ")
            print e

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
