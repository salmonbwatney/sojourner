import socket
import os
import sys
import network
import time

HOST = '0.0.0.0'  # Symbolic name meaning all available interfaces
PORT = 4001      # Arbitrary non-privileged port
sigIn = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # Create new socket
sigIn.bind((HOST, PORT)) # Bind to the connection details specified above
sigIn.listen(1) 
conn, addr = sigIn.accept()
print ('Connected by', addr)

# Servo variables
steering_pin = 17 # Physical pin 11
drive_pin = 27 # Physical pin 13

dutyCycleDriveFwd = 5.0     # Drive Forwards
dutyCycleDriveRev = 55.0    # Drive Backwards
dutyCycleTurnLeft = 45.0   # Turn Left
dutyCycleTurnRight = 95.0  # Turn Right
dutyCycleIdle = 0.0         # Do nothing

driveDelay = 20
steeringDelay = 50

GPIO.setmode(GPIO.BCM) #Set GPIO Ref No. to Broadcom Pin Numbering
GPIO.setup(steering_pin, GPIO.OUT)
GPIO.setup(drive_pin, GPIO.OUT)

drive_servo = GPIO.PWM(drive_pin, 50)
steer_servo = GPIO.PWM(steering_pin, 50)

drive_servo.start(dutyCycleIdle)
steer_servo.start(dutyCycleIdle)

oprCycleToLeft = 50     # Operation cycles for steering
oprCycleToMid = 50      # Operation cycles for steering
oprCycleToRight = 50    # Operation cycles for steering
#Input Catch
def heard(phraseIn):
    Msgin, Client = sigIn.recv(1024)
    print("DEBUG CONSOLE:  " + Msgin)


if (len(sys.argv) >= 2):
    network.call(sys.argv[1], whenHearCall=heard)
else:
    network.wait(whenHearCall=heard)
    
while network.isConnected():

    # If mov_fwd command sent
    if (Msgin == "mov_fwd"):
        while True:
            drive_servo.ChangeDutyCycle(dutyCycleDriveFwd)
            time.sleep(driveDelay)

            if (Msgin == "turn_left"):
                steer_servo.ChangeDutyCycle(dutyCycleTurnLeft)
                time.sleep(steeringDelay)
            elif(Msgin == "turn_right"):
                steer_servo.ChangeDutyCycle(dutyCycleTurnRight)
                time.sleep(steeringDelay)

    # If mov_rev command sent               
    elif (Msgin == "mov_rev"):
        while True:
            drive_servo.ChangeDutyCycle(dutyCycleDriveRev)
            time.sleep(driveDelay)

            if (Msgin == "turn_left"):
                steer_servo.ChangeDutyCycle(dutyCycleTurnLeft)
                time.sleep(steeringDelay)
            elif (Msgin == "turn_right"):
                steer_servo.ChangeDutyCycle(dutyCycleTurnRight)
                time.sleep(steeringDelay)

    # If stop command sent            
    elif (Msgin == "mov_stp"):
        drive_servo.ChangeDutyCycle(dutyCycleIdle)

    else:
        drive_servo.ChangeDutyCycle(dutyCycleIdle)

