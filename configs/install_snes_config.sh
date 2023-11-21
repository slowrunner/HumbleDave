#!/bin/bash

echo "*** Installing snes.config.yaml and snes_slow.config.yaml"
echo "*** sudo cp snes*.config.yaml  /opt/ros/humble/share/teleop_twist_joy/config/"
sudo cp snes*.config.yaml  /opt/ros/humble/share/teleop_twist_joy/config/
ls /opt/ros/humble/share/teleop_twist_joy/config/
