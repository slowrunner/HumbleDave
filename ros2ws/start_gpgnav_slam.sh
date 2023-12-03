#!/bin/bash

echo -e "\n*** STARTING ROS2 GOPIGO3 NAVIGATION MAPPING MODE (SLAM)"
echo "*** Drive GoPiGo3 around room, generating /map topics using asynchronous SLAM"
echo "*** ros2 launch gopigo3_navigation slam.launch.py 'sync=false lam_params_file:=./my_gpgnav_slam.yaml'"
# ros2 launch gopigo3_navigation slam.launch.py 'sync=false slam_params_file:=./my_gpgnav_slam.yaml'
ros2 launch gopigo3_navigation slam.launch.py 'sync:=false' 'params:=/home/ubuntu/HumbleDave/ros2ws/my_mapper_params_online_async.yaml'

# echo "*** Drive GoPiGo3 around room, generating /map topics using asynchronous SLAM"
# echo "*** ros2 launch gopigo3_navigation slam.launch.py 'sync=true lam_params_file:=./my_gpgnav_slam.yaml'"
# ros2 launch gopigo3_navigation slam.launch.py 'sync=true slam_params_file:=./my_gpgnav_slam.yaml'
