#!/bin/bash

rosdep update
apt-get update

source /opt/ros/${ROS_DISTRO}/setup.bash

cd /root/catkin_ws
rosdep install -y -i --from-paths -r src
catkin build -DCMAKE_BUILD_TYPE=Release

source /root/catkin_ws/devel/setup.bash