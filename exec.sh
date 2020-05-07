#!/bin/sh

if [ $# -eq 0 ];
then
    tag=melodic
else
    tag=$@
fi

docker exec -it ros_vnc_${tag} bash
