#!/bin/bash

echo -e "\n*** Capturing one /PoseWithCovarianceStamped topic (flow-style) from slam-toolbox:"
echo "*** ros2 topic echo --once --flow-style /PoseWithCovarianceStamped"
ros2 topic echo --once --flow-style /PoseWithCovarianceStamped
ros2 topic hz /PoseWithCovarianceStamped


