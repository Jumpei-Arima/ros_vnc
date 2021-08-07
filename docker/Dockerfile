ARG ubuntu_version=20.04
ARG ros_distro=noetic
ARG python_version=python3

FROM ubuntu:${ubuntu_version}

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        wget \
        curl \
        git \
        gnupg \ 
        ca-certificates \
        lsb-release && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ROS
ARG ros_distro
ENV ROS_DISTRO=${ros_distro}
## https://wiki.ros.org/${ROS_DISTRO}/Installation/Ubuntu
### Setup source.list
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
### Setup keys
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
###  Install ros-${ROS_DISTRO}-base
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        ros-${ROS_DISTRO}-desktop-full && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
###  Dependencies for building packages
ARG python_version
ENV PYTHON_VERSION=${python_version}
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        ${PYTHON_VERSION}-pip \
        ${PYTHON_VERSION}-rosdep \
        ${PYTHON_VERSION}-rosinstall \
        ${PYTHON_VERSION}-rosinstall-generator \
        ${PYTHON_VERSION}-wstool \
        ${PYTHON_VERSION}-catkin-tools \
        build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN rosdep init && \
    rosdep update

RUN apt-get update && \
    apt-get install -y \
        xvfb \
        x11vnc \
        icewm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root/

COPY ./docker/scripts/. /root/scripts/
RUN chmod -R +x /root/scripts/*

RUN echo "source /root/scripts/initialize-bash-shell.sh" > /root/.bashrc

ENTRYPOINT []

CMD ["/bin/bash"]