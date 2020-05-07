# ros_vnc

## installation

### from docker hub
```
$ docker pull arijun/ros_vnc:melodic
```

### from source code
```
$ git clone https://github.com/Jumpei-Arima/ros_vnc
$ cd ros_vnc
$ ./build.sh <tag_name>
```

## How to use
### run docker container and launch vnc
```
$ ./run_docker_vnc.sh <tag_name>
```

### launch vnc viewer on your local machine
- address: localhost:5900 password: pass
    - you can change port in run_docker_vnc.sh
    - you can change vnc password in scripts/run_vnc.sh
- [vnc viewer](https://chrome.google.com/webstore/detail/vnc%C2%AE-viewer-for-google-ch/iabmpiboiopbgfabjmgeedhcmjenhbla?utm_source=chrome-ntp-launcher)

### run docker container without vnc
```
$ ./run_docker.sh <tag_name>
```

### enter docker container
```
$ ./exec.sh <tag_name>
```

### bridge ros and ros2
```
$ ./run_bridge.sh
```

## Docker tags
### ros
- melodic
- kinetic

### ros2
- dashing
- eloquent

## dependencies
- docker==19.03.8
