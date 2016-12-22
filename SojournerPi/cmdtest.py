import socket
import os
import sys
import network
import time

def heard(cmd):
    print("cmd in: " + cmd)

if (len(sys.argv) >= 2):
    network.call(sys.argv[1], whenHearCall = heard)
    print("Sucessfully Connected to client")
else:
    network.wait(whenHearCall = heard)

while network.isConnected():
    phrase = input()
    print("cmd out: " + phrase)
    network.say(phrase)
