#!/bin/sh

if [ $# -eq 0 ];
then
    tag=eloquent
else
    tag=$@
fi

docker run -it --rm \
    --net="host" \
    --name ros_bridge_${tag} \
    osrf/ros:eloquent-ros1-bridge \
    /bin/bash -c "ros2 run ros1_bridge dynamic_bridge"
