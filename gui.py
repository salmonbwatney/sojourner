#import packages
from __future__ import print_function
from roverCode import GuiThread
from imutils.video import VideoStream
import argparse
import time
import os
import sys

#create new argument parser & arguments
argParser = argparse.ArgumentParser()
argParser.add_argument("--science", required = True, help = "Science Storage Path")
argParser.add_argument("--picamera", type = int, default = -1, help = "Set value larger than 1 to use Picamera")
args = vars(argParser.parse_args())

def spinning_cursor():
    while True:
        for cursor in '|/-\\':
            yield cursor

spinner = spinning_cursor()

# start videostream, camera and the rest of the rover
print ("[NASA] Starting Sojourner Systems")
vidStream = VideoStream(usePiCamera=args["picamera"] > 0).start()
for _ in range(50):
    sys.stdout.write(spinner.next())
    sys.stdout.flush()
    time.sleep(0.1)
    sys.stdout.write('\b')

sojournerGui = GuiThread(vidStream, args["science"])
sojournerGui.root.mainloop()
