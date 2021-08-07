#!/bin/bash

# Source the ROS environment.
source /opt/ros/${ROS_DISTRO}/setup.bash
source /root/catkin_ws/devel/setup.bash

# Setup ROS env params.
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/root/catkin_ws/src/
export ROS_WORKSPACE=/root/catkin_ws
export ROS_HOME=~/.ros
export ROS_IP=`hostname -I | cut -d' ' -f1`
export ROS_MASTER_URI=http://localhost:11311

cd /root/catkin_ws