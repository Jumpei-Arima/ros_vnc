docker run -it --rm \
    --privileged \
    -p 5900:5900 \
    -v $PWD/scripts/:/root/scripts/ \
    -e DISPLAY=:0 \
    --name ros_vnc \
    arijun/ros_vnc:melodic \
    /bin/bash -c "/root/scripts/run_vnc.sh"
