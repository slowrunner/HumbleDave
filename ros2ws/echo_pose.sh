#!/bin/bash

# Note: slam_toolbox issues one /pose topic every half second
# echo -e "\n*** Capturing one /pose topic (flow-style)"
# echo "*** ros2 topic echo --once --flow-style /pose"
# ros2 topic echo --once --flow-style /pose
# ros2 topic hz /pose
ros2 topic echo --flow-style /pose

