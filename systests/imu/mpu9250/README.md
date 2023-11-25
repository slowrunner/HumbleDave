MPU9250 For Raspberry Pi4 GoPiGo3 Robot Humble Dave


REF:  https://pypi.org/project/imusensor/
GIT: https://github.com/niru-5/imusensor  (with examples)

* Install

The pypi version is not up to date with the GitHub version
(pip3 install imusensor  -- installs to user site dist packages)


* Check if present

sudo i2cdetect -y

should see 68 in the list

* first_test.py  (my mod to overwrite result on one line)
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


* ----- ROS2 Driver

sudo apt install libi2c-dev

cd ros2ws/src
git clone https://github.com/hiwad-aziz/ros2_mpu9250_driver.git

rebuild.sh

