from tkinter import *
import os

mainWindow = Tk()

#Disable output repeat
os.system('xset r off')

mouseX = 0
keyPressed = ' '
keyDown = ' '
#mouse enabled steering
def motion(event):
    x = event.x
    #print('{}'.format(x))

'''
def key(event):
    #print ("pressed", repr(event.char))
    keyPressed = event.char
    print(keyPressed)
'''

def keydown(e):
    keyDown = e.char
    print(keyDown)
    
mainWindow.bind('<W>', keydown)
mainWindow.bind('<Motion>', motion)
mainWindow.mainloop()
