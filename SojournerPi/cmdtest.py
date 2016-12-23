import socket
import os
import sys
import time

host = '192.168.0.4'  # Symbolic name meaning all available interfaces
port = 8888        # Arbitrary non-privileged port

#Debug Data
print("host: " + host)
print("port: ",port)
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host, port))
s.listen(1)
conn, addr = s.accept()
print ('Connected by', addr)

while 1:
    data=conn.recv(2048)
    readData = data.decode('utf-8')
    if not data: break
    if (readData =="test button"):
        print("button test recieved")
    os.system(str(data))
conn.close()
