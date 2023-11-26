#!/bin/bash

cd ~/HumbleDave/configs
echo "*** Installing new slam-toolbox localization_launch.py modified to take params_file parameter"
sudo mv /opt/ros/humble/share/slam_toolbox/launch/localization_launch.py /opt/ros/humble/share/slam_toolbox/launch/localization_launch.py.orig
sudo cp new_localization_launch.py  /opt/ros/humble/share/slam_toolbox/launch/localization_launch.py
ls /opt/ros/humble/share/slam_toolbox/launch/
