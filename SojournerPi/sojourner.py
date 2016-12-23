import RPi.GPIO as GPIO
import socket
import os
import sys
import time

#Pin Variables
sPin = 11 # Steering assigned to physical pin 11
dPin = 12 # Drive assigned to physical pin 12

# Pin mode setup
GPIO.setmode(GPIO.BOARD) # Set GPIO referencing numbers to Broadcom Pin Numbering

# GPIO Setup
GPIO.setup(dPin, GPIO.OUT)
GPIO.setup(sPin, GPIO.OUT)

dServo = GPIO.PWM(dPin, 50)
stServo = GPIO.PWM(sPin, 50)

# Duty Cycles
cycleFwd = 5.0
cycleRev = 55.0
cycleLeft = 45.0
cycleRight = 95.0
cycleIdle = 0.0

# Servo Assignment
dServo = GPIO.PWM(dPin, 50)
stServo = GPIO.PWM(sPin, 50)

# Cycle Delays
driveDelay = 20
steerDelay = 200

# Initialize Servo control
dServo.start(cycleIdle)
stServo.start(cycleIdle)

# Connection Stuff
host = '192.168.0.4'
port = 8888

serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serverSocket.bind((host, port))
serverSocket.listen(1)
serverConnection, clientAddress = serverSocket.accept()
print("Client is connecting from:  ", clientAddress)

# Where the magic happens
while 1:
    rawData = serverConnection.recv(32) # Store incoming data, set buffer size to 32 bytes
    command = rawData.decode('utf-8')
    
    if not rawData:
        time.sleep(1)

    #move forward
    if (command == "mov_fwd"):
        dServo.ChangeDutyCycle(cycleFwd)
        time.sleep(driveDelay)
        print("moving forward")

    if (command == "stop"):
        dServo.ChangeDutyCycle(cycleIdle)
        print("stopped")
