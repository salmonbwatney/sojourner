import socket
import os
import sys
import time

HOST = '192.168.1.3'  # Symbolic name meaning all available interfaces
PORT = 8888        # Arbitrary non-privileged port
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)
conn, addr = s.accept()
print ('Connected by', addr)

while 1:
    data = conn.recv(16)
    data_recv += len(data)
    if not data: break
    if (data == "test_btn"):
        print >> (sys.stderr, 'recieved "%s" %data')
