#!/bin/bash

# for mpu9250driver package
echo -e "\n*** Capturing one MPU9250 IMU topic (flow-style):"
echo "*** ros2 topic echo --once --flow-style /imu"
ros2 topic echo --once --flow-style /imu

