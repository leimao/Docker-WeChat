# Docker WeChat

## Introduction

Docker WeChat is a Ubuntu based Docker image that has Linux WeChat installed. 

## Usages

### Build Docker Image

```bash
docker build -f docker/wechat.Dockerfile --tag=wechat:0.0.1 .
```

### Run Docker WeChat

```bash
docker run \
    -it \
    --rm \
    --ipc=host \
    -e DISPLAY=$DISPLAY \
    -e XMODIFIERS=@im=fcitx \
    -e QT_IM_MODULE=fcitx \
    -e GTK_IM_MODULE=fcitx \
    -e DISPLAY=unix$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.config/weixin:/root/.config/weixin \
    wechat:0.0.1
```

## FAQs

### Difference to Other Docker WeChat

The WeChat in other Docker WeChats is usually emulated with Wine, whereas the WeChat in this Docker WeChat is build natively on Linux.

### Cannot Change Input Methods

Other Wine based [Docker WeChat](https://hub.docker.com/r/bestwu/wechat/) does not have the issue with fcitx input methods. However, fcitx input methods does not work for Docker WeChat, preventing the user from entering Chinese.
