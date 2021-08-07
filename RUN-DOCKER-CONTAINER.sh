#!/bin/bash

IMAGE_NAME=arijun/ros_vnc
CONTAINER_NAME="ros_ws"
echo "$0: IMAGE=${IMAGE_NAME}"
echo "$0: CONTAINER=${CONTAINER_NAME}"

EXISTING_CONTAINER_ID=`docker ps -aq -f name=${CONTAINER_NAME}`
if [ ! -z "${EXISTING_CONTAINER_ID}" ]; then
    RUNNING_CONTAINER_ID=`docker ps -aq -f name=${CONTAINER_NAME} -f status=running`
    if [ -z "${RUNNING_CONTAINER_ID}" ]; then
        docker container start ${CONTAINER_NAME}
    fi
    docker exec -it ${CONTAINER_NAME} bash
else
    docker run -it \
        --privileged \
        --publish 5900:5900 \
        --env DISPLAY=:0 \
        --volume ${PWD}/catkin_ws/:/root/catkin_ws/ \
        --volume /dev/:/dev/ \
        --name ${CONTAINER_NAME} \
        ${IMAGE_NAME} \
        bash -c "/root/scripts/run-vnc.sh > /dev/null 2>&1 & bash"
fi