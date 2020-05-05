#/bin/sh

if [ $# -eq 0 ];
then
    tag=melodic
else
    tag=$@
fi

docker build . -f dockerfiles/Dockerfile.${tag} -t arijun/ros_vnc:${tag}
