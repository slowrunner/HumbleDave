#!/bin/bash 

echo -e "\nSwitching to ~/ros2ws"
cd ~/ros2ws

echo -e "\nSourcing install/setup.bash"
. ~/ros2ws//install/setup.bash

echo -e "\nStart MPU9250 IMU sensor node"
echo "ros2 run mpu9250_driver mpu9250driver_launch.py"
ros2 launch mpu9250driver mpu9250driver_launch.py



