import socket
import os
import sys
import time

HOST = '192.168.1.12'  # Symbolic name meaning all available interfaces
PORT = 9050        # Arbitrary non-privileged port
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)
conn, addr = s.accept()
print ('Connected by', addr)

while 1:
    data = conn.recv(1024)
    print(data)
