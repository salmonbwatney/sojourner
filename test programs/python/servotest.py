import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BOARD)

GPIO.setup(12, GPIO.OUT)

p = GPIO.PWM(12, 50)
duty_cycle = 7
delay_time = 20 #in ms
p.start(duty_cycle)

try:
    while True:
        p.ChangeDutyCycle(duty_cycle)
        time.sleep(delay_time)
except KeyboardInterrupt:
    p.stop()
    GPIO.cleanup()
