#!/bin/bash 

echo -e "\n\n******** STARTING ROBOT DAVE WITH LOCALIZATION ********"

echo -e "\n*** Switching to ~/HumbleDave/ros2ws"
cd ~/HumbleDave/ros2ws

echo -e "\n*** Sourcing install/setup.bash"
. ~/HumbleDave/ros2ws/install/setup.bash

echo -e "\n*** Start ROS2 GoPiGo3 node"
echo "*** ros2 run ros2_gopigo3_node gopigo3_node --ros-args -p S1LPW:=2094 -p S1RPW:=750 -p S1SECTOR:=2.443 &"
ros2 run ros2_gopigo3_node gopigo3_node --ros-args -p S1LPW:=2094 -p S1RPW:=750 -p S1SECTOR:=2.443 &

# Example starting with a yaml file for parameters
# ros2 run ros2_gopigo3_node gopigo3_node --ros-args --params-file ./src/ros2_gopigo3_node/gopigo3_node_params.yaml &


# UNCOMMENT ONE OF THE ROBOT STATE AND JOINT STATE PUBLISHERS
echo -e "\n*** Starting Robot_State and Joint_State Publishers"
echo "*** with URDF file: dave.urdf"
ros2 launch ros2_gopigo3_node ros2_dave_state_and_joint.launch.py &

# echo -e "\n*** Starting Robot_State and Joint_State Publishers"
# echo "*** with URDF file: gpgMin.urdf"
# ros2 launch ros2_gopigo3_node ros2_gpgMin_state_and_joint.launch.py &

# echo -e "\n*** Starting Robot_State and Joint_State Publishers"
# echo "*** with URDF file: finmark.urdf"
# ros2 launch ros2_gopigo3_node ros2_finmark_state_and_joint.launch.py &

# Uncomment to publish /distance_sensor/distance topic
# echo -e "\n*** Start GoPiGo3 distance sensor node"
# echo "*** ros2 run ros2_gopigo3_node distance_sensor &"
# ros2 run ros2_gopigo3_node distance_sensor &

# Uncomment to publish ultrasonic ranger
# echo -e "\n*** Start GoPiGo3 ultrasonic sensor node"
# echo "*** ros2 run ros2_gopigo3_node ultrasonic_ranger &"
# ros2 run ros2_gopigo3_node ultrasonic_ranger &

echo -e "\n** NOT STARTING GoPiGo3 IMU SENSOR NODE"
# echo -e "\n*** Start GoPiGo3 IMU sensor node"
# echo "*** ros2 run ros2_gopigo3_node imu_sensor &"
# ros2 run ros2_gopigo3_node imu_sensor &

echo -e "\n*** NOT STATING SNES GAMEPAD NODE"
# echo -e "\n*** Start SNES gamepad node"
# echo '*** nohup ros2 launch teleop_twist_joy teleop-launch.py joy_config:="snes" &'
# nohup ros2 launch teleop_twist_joy teleop-launch.py joy_config:="snes" &
# echo '*** nohup ros2 launch teleop_twist_joy teleop-launch.py joy_config:="snes_slow" &'
# nohup ros2 launch teleop_twist_joy teleop-launch.py joy_config:="snes_slow" &

echo -e "\n*** STARTUP SLEEP 5s BEFORE STARTING LIDAR"
sleep 1
echo "5"
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1

echo -e "\n*** Start YDLidar X4 node"
echo "*** nohup ros2 launch ydlidar_ros2_driver ydlidar_launch.py &"
# with nohup.out logging
# nohup ros2 launch ydlidar_ros2_driver ydlidar_launch.py &
# without logging (if call stop_scan service the nohup.out grows quickly)
ros2 launch ydlidar_ros2_driver ydlidar_launch.py &


# Uncomment the following instead of using start_image_pub.sh
# echo -e "\n*** Start Camera /Image topic publisher Node"
# echo "*** nohup ros2 run ros2_libcamera_pub libcamera_jpg_pub &"
# nohup ros2 run ros2_libcamera_pub libcamera_jpg_pub &


# Uncomment the following instead of using start_slam_toobox.sh
echo -e "\n*** STARTING ROS2 SLAM-TOOLBOX - LOCALIZATION MODE"

# with logging to nohup.out
# echo "*** nohup ros2 launch slam_toolbox online_async_launch.py 'slam_params_file:=./my_mapper_params_online_async.yaml' &"
# nohup ros2 launch slam_toolbox localization_launch.py 'slam_params_file:=./my_loc_params.yaml' &

# without logging 
echo "*** ros2 launch slam_toolbox localization_launch.py 'slam_params_file:=./my_loc_params.yaml' &"
ros2 launch slam_toolbox localization_launch.py 'slam_params_file:=./my_loc_params.yaml' &


echo -e "\n*** Publishing servo one center position (0.0)"
nohup ros2 topic pub --once /servo/position/S1 std_msgs/msg/Float64 '{data: 0.0}' &

echo -e "\n*** Starting Odometer Node to log movements to odometer.log"
echo "*** ros2 run ros2_gopigo3_node odometer &"
ros2 run ros2_gopigo3_node odometer &


echo -e "\n*********DONE start_robot_dave.sh DONE *******\n"
