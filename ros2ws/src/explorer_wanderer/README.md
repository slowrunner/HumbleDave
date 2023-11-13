# explorer_wanderer

REF: https://github.com/DaniGarciaLopez/ros2_explorer/tree/main  

Searched for "ROS2 wander node" found explorer_wanderer package which uses LIDAR /scan topic to avoid walls/obstacles.  

Changes:  
  * wanderer.py
    - replaced explicit qos profile of "10" with qos_profile_sensor_data, which is 10 with BEST_EFFORT   
    - changed "obstacle" distance from 0.8 to 0.200
    - changed travel distances from 1000.0 to 200.0
  * setup.cfg
    - changed script-dir to script_dir, install-dir to install_dir
