#!/bin/sh

if [ $# -eq 0 ];
then
    tag=melodic
else
    tag=$@
fi

docker run -it --rm \
    --net="host" \
    --name ros_vnc_${tag} \
    arijun/ros_vnc:${tag} \
    /bin/bash
