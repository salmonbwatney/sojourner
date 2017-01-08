# import packages

import io
import socket
import struct
import time
import picamera

with picamera.PiCamera() as camera:
    camera.resolution = (640, 480)
    camera.framerate = 24

    server_socket = socket.socket()
    server_socket.bind(('0.0.0.0', 8001))
    server_socket.listen(0)

    #Accept single connection and make file-like object
    connection = server_socket.accept()[0].makefile('wb')
    try:
        camera.start_recording(connection, format = 'h264')
        camera.wait_recording(10)
        camera.stop_recording()

    finally:
        connection.close()
        server_socket.close()
