#!/usr/bin/env python3

# FILE: pkg:HoROS8 node: wanderAround.py

# ROS 2 Version of the Hands On ROS For Robotics Programming Chapter 8
# node wanderAround

# Conversion: slowrunner

import rclpy
from rclpy.node import Node
from rclpy.qos import qos_profile_sensor_data

from std_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from statistics import mean

NUM_READINGS = 14
NUM_RANGES = 561
MAX_SPEED = 0.15 #ms

i_forward = int(NUM_RANGES/2)-1  # may not be exact front if even number of ranges
i_left = int(NUM_RANGES * 0.75) 
i_left_forward = int((i_forward + i_left)/2)  # half way between forward and left
i_right = int(NUM_RANGES/4)
i_right_forward = int((i_forward + i_right)/2)  # half way between forward and right
i_back = NUM_RANGES - 1

class MoveForward():
    def __init__(self):
        super().__init__('move_forward')
        self.distanceLaser=1.6 # =1.6 meters (<1.13m, the matching distance to distanceRange=0.8m)
        self.distanceRange=2 # =2 meters
        # self.msg=Twist()
        # self.msg=Twist()
        self.twist_msg = Twist()
        
        # rospy.init_node("move_forward",anonymous=False)
        # rospy.on_shutdown(self.shutdown)
        
        # self.cmd_vel = rospy.Publisher("/cmd_vel",Twist)
        self.cmd_vel_pub = self.create_publisher(Twist,"/cmd_vel",qos_depth=10)
        # rospy.Subscriber("/gopigo/scan",LaserScan,self.laser_callback)
        self.subscription = self.create_subscription(LaserScan, 'scan', self.laser_callback, qos_profile_sensor_data)
        # rospy.Subscriber("/gopigo/distance",Range,self.range_callback)
        
        # r = rospy.Rate(5)
        if DEBUG:
            self.hz = 1
        else:
            self.hz = 5
        period_for_timer = 1.0 / self.hz
        self.timer = self.create_timer( period_for_timer, self.move_forward_cb)
        self.get_logger().info('move_forward: created move_forward_cb at {} Hz'.format(self.hz))

        # while not rospy.is_shutdown():
        #     self.cmd_vel.publish(self.msg)
        #     r.sleep()
    def move_forward_cb(self):
        self.cmd_vel_pub.publish(self.twist_msg)
        self.get_logger().info('move_forward_cb: published cmd_vel topic')

    def range_callback(self, scan):
        closest = scan.range
        rospy.loginfo("FRONT distance %s m", closest)
        if closest>self.distanceRange:
            self.msg.linear.x = FORWARD_SPEED # FORWARD_SPEED m/s
            self.msg.angular.z = SPIRAL_SPEED
        elif closest<self.distanceRange:
            self.msg.linear.x = BACKWARD_SPEED  # BACKWARD_SPEED m/s
            self.msg.angular.z = -ROTATION_SPEED # ROTATION_SPEED rad/s
            rospy.loginfo("Within DISTANCE threshold -> ROTATE the robot")
                 
    
    def laser_callback(self, scan):
        closest = min(scan.ranges)
        furthest = max(scan.ranges)
        rospy.loginfo("LASER distance %s  --  %s", closest, furthest)
        if closest<self.distanceLaser:
            self.msg.linear.x = laser_BACKWARD_SPEED_multiplier *BACKWARD_SPEED
            self.msg.angular.z = laser_ROTATION_SPEED_multiplier *ROTATION_SPEED
            rospy.loginfo("Within LASER threshold --> ROTATE FASTER the robot")
               
    def shutdown(self):
        self.msg.linear.x= 0
        self.msg.angular.z = 0
        self.cmd_vel.publish(self.msg)
        rospy.sleep(1)

if __name__ == '__main__':
    try:
        MoveForward()
        rospy.spin()
    except KeyboardInterrupt:
        print "Ending MoveForward"

class WanderAround(Node):

  def __init__(self):
    super().__init__('wanderAround')
    self.pub = self.create_publisher(Twist, 'cmd_vel', qos_profile=10)
    self.sub = self.create_subscription(
      LaserScan,
      'scan',
      self.sub_callback,
      qos_profile_sensor_data)
    self.sub  # prevent unused var warning
    self.get_logger().info('scan topic subscriber created')
    self.get_logger().info('cmd_vel topic publisher created')


  def sub_callback(self, msg):
    doubled_msg = Int32()
    doubled_msg.data = number_msg.data * 2
    self.pub.publish(doubled_msg)


def main(args=None):

  rclpy.init(args=args)
  doubler_node = DoublerNode()
  try:
    rclpy.spin(doubler_node)
  except KeyboardInterrupt:
    print('\ncontrol-c: doubler_node shutting down')
  finally:
    doubler_node.destroy_node()
    rclpy.shutdown()





def main():
    print('Hi from HoROS8.')


if __name__ == '__main__':
    main()
