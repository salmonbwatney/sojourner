import socket
import os
import sys

HOST = 'localhost'  # Symbolic name meaning all available interfaces
PORT = 4000       # Arbitrary non-privileged port
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)
conn, addr = s.accept()
print ('Connected by', addr)

if __name__ == "__main__":
    while(1):
        Sojourner, Client = PySocket.recvfrom(1024)
        print(Sojourner)

