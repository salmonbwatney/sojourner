from Tkinter import Tk, Canvas, PhotoImage, mainloop
import math
import time

# Used to store debug file
#import os
#BASE_DIR = os.path.realpath(os.path.dirname(__file__))


# Some config width height settings
canvas_width = 640
canvas_height = 480

# Create a window
window = Tk()
# Set the window title
window.wm_title("Sine Wave")

# Put a canvas on the window
canvas = Canvas(window, width=canvas_width, height=canvas_height, bg="#000000")
canvas.pack()

# Create a image, this acts as the canvas
img = PhotoImage(width=canvas_width, height=canvas_height)

# Put the image on the canvas
canvas.create_image((canvas_width/2, canvas_height/2), image=img, state="normal")



def sine_wave_anim():

    # Update sine wave
    frequency = 4
    amplitude = 50 # in px
    speed = 68

    # We create a blank area for what where we are going to draw
    color_table = [["#000000" for x in range(0, canvas_width)] for y in range(0, amplitude*2)]

    # And draw on that area
    for x in range(0, canvas_width):
        y = int(amplitude + amplitude*math.sin(frequency*((float(x)/canvas_width)*(2*math.pi) + (speed*time.time()))))
        color_table[y][x] = "#ffff00"

        # Don't individually put pixels as tkinter sucks at this
        #img.put("#ffff00", (x, y))

    # Then batch put it on the canvas 
    # tkinter is extremely inefficient doing it one by one
    img.put(''.join("{" + (" ".join(str(color) for color in row)) + "} " for row in color_table), (0, int(canvas_height/2 - amplitude)))

    # Debug the color_table
    #with open(os.path.join(BASE_DIR, 'output.txt'), "w+") as text_file:
    #   text_file.write(''.join("{" + (" ".join(str(color) for color in row)) + "} " for row in color_table))


    # Continue the animation as fast as possible. A value of 0 (milliseconds), blocks everything.
    window.after(1, sine_wave_anim)


# Start off the anim
sine_wave_anim()
mainloop()
