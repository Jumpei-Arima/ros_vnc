FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        wget \
        curl \
        git \
        vim \
        xvfb \
        x11vnc \
        lsb-release \
        gnupg \
    && rm -rf /var/lib/apt/lists/*

# ROS setting
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://ha.pool.sks-keyservers.net:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                       ros-melodic-desktop-full

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
RUN apt-get install -y --no-install-recommends \
                       python-rosdep \
                       python-rosinstall \
                       python-rosinstall-generator \
                       python-wstool \
                       python-catkin-tools \
                       g++ \
    && rm -rf /var/lib/apt/lists/*
RUN rosdep init && rosdep update

WORKDIR /root
RUN mkdir -p ros_catkin_ws/src \
    && cd ros_catkin_ws \
    && /bin/bash -c "source /opt/ros/melodic/setup.bash; catkin build"

ENV ROS_PACKAGE_PATH=/root/ros_catkin_ws:$ROS_PACKAGE_PATH
ENV ROS_WORKSPACE=/root/ros_catkin_ws
WORKDIR /root

# window manager
RUN apt-get update && \
    apt-get install -y \
        icewm \
    && rm -rf /var/lib/apt/lists/*
