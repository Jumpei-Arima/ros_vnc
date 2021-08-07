# ros_vnc

## install docker image

### pull docker image from docker hub
```
$ docker pull ghcr.io/jumpei-arima/ros_vnc
```

### Build docker image from Dockerfile
```
$ git clone https://github.com/Jumpei-Arima/ros_vnc
$ cd ros_vnc
$ ./BUILD-DOCKER-IMAGE.sh
```

## How to use
### run docker container and launch vnc
```
$ ./RUN-DOCKER-CONTAINER.sh
```

### launch vnc viewer on your local machine
- address: localhost:5900 password: pass
    - you can change port in RUN-DOCKER-CONTAINER.sh
    - you can change vnc password in docker/scripts/run_vnc.sh
- [vnc viewer](https://chrome.google.com/webstore/detail/vnc%C2%AE-viewer-for-google-ch/iabmpiboiopbgfabjmgeedhcmjenhbla?utm_source=chrome-ntp-launcher)

## dependencies
- docker>=19.03