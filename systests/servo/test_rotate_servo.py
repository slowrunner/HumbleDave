#!/usr/bin/env python3

import easygopigo3
from time import sleep

gpg3_obj = easygopigo3.EasyGoPiGo3()
servo = gpg3_obj.init_servo("SERVO1")

# Cannot put control horn on servo for exact center
# So must find "MY_CENTER"
MY_CENTER = 85

# Rotating the servo too far causes the distance sensor to hit the frame
# which will stall the servo drawing excessive current which can cause the 
# processor voltage to dip below 4.75v and a reboot
#
MAX_RIGHT = MY_CENTER - 70
MAX_LEFT  = MY_CENTER + 70

servo.rotate_servo(MAX_RIGHT)
# allow time for the servo to slew to the requested angle
sleep(0.5)

servo.rotate_servo(MAX_LEFT)
# allow time for the servo to slew to the requested angle
sleep(0.5)

servo.rotate_servo(MY_CENTER)
# allow time for the servo to slew to the requested angle
sleep(0.5)

# Now remove the holding signal from the servo
# to prevent accidental stalls and save battery
servo.disable_servo()
