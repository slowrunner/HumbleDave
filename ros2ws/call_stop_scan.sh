#!/bin/bash

# FILE: call_stop_scan.sh

# PURPOSE:  call the ydlidar node's /stop_scan service
#           Saves 0.7W

echo -e "\n*** Calling ydlidar_ros_driver's /stop_scan service"
echo -e "ros2 service call /stop_scan std_srvs/Empty"
ros2 service call /stop_scan std_srvs/Empty
