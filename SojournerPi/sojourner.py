'''
    Copyright 2016 © <Your Name>, Some Rights Reserved
    
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
    Date Created:		December 23, 2016
    Date Last Modified: 	December 23, 2016
    File Name: 			sojourner.py
    File Description: 		the main control file
'''

# import required libraries
import RPi.GPIO as gpio
import socket
import os
import sys
import time

# servo pin assignment
drivePin = 12 # phys. pin 12
turnPin = 11  # phys. pin 11

# gpio config
gpio.setmode(gpio.BOARD) # set pin numbering system

gpio.setup(drivePin, gpio.OUT)
gpio.setup(turnPin, gpio.OUT)

driveServo = gpio.PWM(drivePin, 50)
turnServo = gpio.PWM(turnPin, 50)

# servo config
dcFwd = 5.0
dcRev = 55.0
dcLeft = 45.0
dcRight = 95.0
dcIdle = 0.0

st = 0.020 # sleep time

# connection config
host = '192.168.0.4'
port = 8888

print("host:  " + host)
print("port:  " , port)

serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serverSocket.bind((host, port))
serverSocket.listen(1)
connection, client = serverSocket.accept()
print('Connected to:  ', client)

# start servos
driveServo.start(dcIdle)
turnServo.start(dcIdle)

# Process commands
def commandProcessing():
    rawData=connection.recv(32) # store the incomming data sent through 32 byte buffer
    cmdStore = rawData.decode('utf-8') # decode the raw data into something usable
    return cmdStore

# drive forwards
def driveFwd():
    driveServo.ChangeDutyCycle(dcFwd)

# drive backwards
def driveRev():
    driveServo.ChangeDutyCycle(dcRev)
 
# stop
def stopRvr():
    driveServo.ChangeDutyCycle(dcIdle)
  
try:
    while 1:
        rawData=connection.recv(32) # store the incomming data sent through 32 byte buffer
        cmd = rawData.decode('utf-8') # decode the raw data into something usable
    
        # go forward
        while (cmd == "mov_fwd"):
            driveFwd()
            print("moving forward")
            cmd = ""
            

            # go backwards
            if (cmd == "mov_rev"):
                driveRev()
                print("backing up")
               cmd = ""
            
            if (cmd == "stop"):
               stopRvr()
                print("stopping")
                cmd = ""
            
            
except KeyboardInterrupt:
    driveServo.stop()
    turnServo.stop()
    gpio.cleanup()



        
