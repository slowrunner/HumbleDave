#!/bin/bash

# FILE: call_start_scan.sh

# PURPOSE:  call the ydlidar node's /start_scan service

echo -e "\n*** Calling ydlidar_ros_driver's /start_scan service"
echo -e "ros2 service call /start_scan std_srvs/Empty"
ros2 service call /start_scan std_srvs/Empty
