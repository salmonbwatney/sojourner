import socket
import os
import sys
import network

HOST = '0.0.0.0'  # Symbolic name meaning all available interfaces
PORT = 4001      # Arbitrary non-privileged port
sigIn = socket.socket(socket.AF_INET, socket.SOCK_STREAM) #Create new socket
sigIn.bind((HOST, PORT)) #Bind to the connection details specified above
sigIn.listen(1) 
conn, addr = sigIn.accept()
print ('Connected by', addr)


#Input Catch
def heard(phraseIn):
    Msgin, Client = sigIn.recv(1024)
    print("DEBUG CONSOLE:  " + phrase)


if (len(sys.argv) >= 2):
    network.call(sys.argv[1], whenHearCall=heard)
else:
    network.wait(whenHearCall=heard)
    
while network.isConnected():
    phrase = input();
    print("RESPONSE:  " + phrase)
    network.say(phrase)

