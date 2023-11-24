MPU9250 For Raspberry Pi4 GoPiGo3 Robot Humble Dave

* Install

pip3 install imusensor easydict
(installs to user site dist packages)


* Check if present

sudo i2cdetect -y

should see 68 in the list

* first_test.py
#!/usr/bin/env python3

import os
import sys
import time
import smbus

from imusensor.MPU9250 import MPU9250

address = 0x68
bus = smbus.SMBus(1)
imu = MPU9250.MPU9250(bus, address)
imu.begin()
# imu.caliberateGyro()
# imu.caliberateAccelerometer()
# or load your own caliberation file
#imu.loadCalibDataFromFile("/home/pi/calib_real_bolder.json")

while True:
	imu.readSensor()
	imu.computeOrientation()

	print ("roll: {:>4.1f} ; pitch : {:>4.1f} ; yaw : {:>4.0f}".format(imu.roll, imu.pitch, imu.yaw),end='\r')
	time.sleep(0.1)

# ------ EOF
