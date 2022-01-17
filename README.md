# Docker WeChat

## Introduction

Docker WeChat is a Ubuntu based Docker image that has the latest [Linux WeChat](https://www.ubuntukylin.com/applications/106-cn.html) installed. 

## Usages

### Build Docker Image

```bash
$ docker build -f docker/wechat.Dockerfile --tag=wechat:0.0.1 .
```

Alternatively, the prebuilt Docker image could be pulled from Docker Hub.

```bash
$ docker pull leimao/wechat:0.0.1
```

### Run Docker WeChat

```bash
$ xhost +
$ docker run \
    -it \
    --rm \
    --ipc=host \
    -e DISPLAY=$DISPLAY \
    -e XMODIFIERS=@im=fcitx \
    -e QT_IM_MODULE=fcitx \
    -e GTK_IM_MODULE=fcitx \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v $HOME/.config/weixin:/root/.config/weixin \
    wechat:0.0.1
$ xhost -
```

## FAQs

### Does This Docker WeChat Work?

As of 1/15/2022, this Docker WeChat still works fine.

### Difference to Other Docker WeChat

The WeChat in other Docker WeChat is usually emulated with Wine, whereas the WeChat in this Docker WeChat is build natively on Linux. The advantages of this Docker WeChat compared to the Wine emulated WeChat is that this Docker WeChat has fewer dependencies and the configuration is much easier.

### Cannot Change Input Methods

Other Wine based [Docker WeChat](https://hub.docker.com/r/bestwu/wechat/) does not have the issue with fcitx input methods. However, fcitx input methods does not work for Docker WeChat, preventing the user from entering Chinese. Please contribute if you know the solution to this issue.
