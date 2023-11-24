#!/usr/bin/env python3

# FILE:  madgwick_test.py
# REF: https://pypi.org/project/imusensor/
# MORE: https://www.x-io.co.uk/res/doc/madgwick_internal_report.pdf

# My mod to overwrite print results on one line


"""
Orientation from accelerometer and magnetometer are noisy, 
while estimating orientation from gyroscope is noise free but accumulates drift over time. 
We will combining both of these to obtain more stable orientation. 
There are multiple ways to do it and we have given two options of kalman and madgwick. 

Madgwick

This is slightly better than kalman and more smooth in giving out the orientation. 
However, for this to work properly, the sensor fusion needs to run at least 10 times faster frequency 
than the sensor sampling frequency. 

"""
import os
import sys
import time
import smbus


from imusensor.MPU9250 import MPU9250
from imusensor.filters import madgwick

sensorfusion = madgwick.Madgwick(0.5)

address = 0x68
bus = smbus.SMBus(1)
imu = MPU9250.MPU9250(bus, address)
imu.begin()

# imu.caliberateGyro()
# imu.caliberateAccelerometer()
# or load your own caliberation file
#imu.loadCalibDataFromFile("/home/pi/calib_real4.json")

currTime = time.time()
print_count = 0
while True:
	imu.readSensor()
	for i in range(10):
		newTime = time.time()
		dt = newTime - currTime
		currTime = newTime

		sensorfusion.updateRollPitchYaw(imu.AccelVals[0], imu.AccelVals[1], imu.AccelVals[2], imu.GyroVals[0], \
									imu.GyroVals[1], imu.GyroVals[2], imu.MagVals[0], imu.MagVals[1], imu.MagVals[2], dt)

	if print_count == 2:
		print ("mad roll: {:>4.1f} ; mad pitch : {:>4.1f} ; mad yaw : {:>4.1f}".format(sensorfusion.roll, sensorfusion.pitch, sensorfusion.yaw),end='\r')
		print_count = 0

	print_count = print_count + 1
	time.sleep(0.01)
