#/bin/sh

IMAGE_NAME=$1
if [ $# -eq 0 ]; then
    IMAGE_NAME=ros_vnc
fi
TAG_NAME=latest
echo "IMAGE_NAME=${IMAGE_NAME}"
echo "TAG_NAME=${TAG_NAME}"

docker build . -f docker/Dockerfile -t $IMAGE_NAME:${TAG_NAME}