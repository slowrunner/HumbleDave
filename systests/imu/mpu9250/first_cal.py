#!/usr/bin/env python3


# FILE: first_test.py
# REF: https://pypi.org/project/imusensor/
#
# My mod to overwrite print results on one line

import os
import sys
import time
import smbus

from imusensor.MPU9250 import MPU9250

address = 0x68
bus = smbus.SMBus(1)
imu = MPU9250.MPU9250(bus, address)
imu.begin()
imu.caliberateGyro()
imu.caliberateAccelerometer()
imu.saveCalibDataToFile("./calib.json")
print ("calib data saved")
# or load your own caliberation file
#imu.loadCalibDataFromFile("/home/pi/calib_real_bolder.json")

while True:
	try:
		imu.readSensor()
		imu.computeOrientation()

		print ("\rroll: {:>5.1f} ; pitch : {:>5.1f} ; yaw : {:>5.0f}   ".format(imu.roll, imu.pitch, imu.yaw),end='')
		time.sleep(0.1)
	except KeyboardInterrupt:
		print("\n")
		break
