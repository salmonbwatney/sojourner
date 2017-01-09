# import packages
from Tkinter import *
import os
import time
import threading

#new root window
root = Tk()

#window configuration settings
root.configure(background = 'black')

#science button
captureScience = Button(root, text = "Record Science", command = getScience)
captureScience.grid(row = 3, column = 2, padx = 10, pady = 10)



root.mainloop()
