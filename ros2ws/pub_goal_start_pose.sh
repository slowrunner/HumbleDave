#!/bin/bash

# FILE:  pub_goal_start_pose.sh

# PURPOSE: Issues a goal to the Nav2 node to move the robot back to the starting pose {0,0}

echo -e "\n*** Publish goal {0,0} (x,y)"
echo -e "ros2 topic pub --once /goal_pose geometry_msgs/PoseStamped \"{header: {stamp: {sec: 0}, frame_id: 'map'}, pose: {position: {x: 0.0, y: 0.0, z: 0.0}, orientation: {w: 1.0}}}\""
ros2 topic pub --once /goal_pose geometry_msgs/PoseStamped "{header: {stamp: {sec: 0}, frame_id: 'map'}, pose: {position: {x: 0.0, y: 0.0, z: 0.0}, orientation: {w: 1.0}}}"

