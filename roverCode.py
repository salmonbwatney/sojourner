# import packages

import io
import socket
import struct
import time
import picamera

with picamera.PiCamera() as camera:
    camera.resolution = (640, 480)
    camera.framerate = 24

    client_socket = socket.socket()
    client_socket.bind(('192.168.0.30', 8001))


    #Accept single connection and make file-like object
    connection = client_socket.makefile('wb')
    try:
        camera.start_recording(connection, format = 'h264')
        camera.wait_recording(10)
        camera.stop_recording()

    finally:
        connection.close()
        server_socket.close()
