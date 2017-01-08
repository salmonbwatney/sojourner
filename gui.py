# import packages
import socket
from Tkinter import *

mainWindow = Tk()

client_socket = socket.socket()
client_socket.connect(('192.168.0.4', 8001))

connection = client_socket.makefile('wb')

Label(image = wb)

mainWindow.mainloop()
