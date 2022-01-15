Docker-WeChat


apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 56583E647FFA7DE7


```
docker build -f docker/wechat-ubuntu.Dockerfile --tag=wechat-ubuntu:0.0.1 .
```


docker run \
    -it \
    --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e XMODIFIERS="@im=fcitx" \
    -e QT_IM_MODULE="fcitx" \
    -e GTK_IM_MODULE="fcitx" \
    -e LC_ALL=C \
    -e QT_X11_NO_MITSHM=1 \
    wechat-ubuntu:0.0.1

docker run \
    -it \
    --rm \
    --ipc=host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e XMODIFIERS=@im=fcitx \
    -e QT_IM_MODULE=fcitx \
    -e GTK_IM_MODULE=fcitx \
    -e DISPLAY=unix$DISPLAY \
    wechat-ubuntu:0.0.1


echo "deb http://archive.ubuntukylin.com/ubuntukylin focal-partner main" > /etc/apt/sources.list.d/wechat.list


https://help.accusoft.com/PrizmDoc/v12.2/HTML/Installing_Asian_Fonts_on_Ubuntu_and_Debian.html
https://blog.longwin.com.tw/2020/12/linux-docker-gui-chinese-input-enable-2020/
https://github.com/wszqkzqk/deepin-wine-ubuntu/issues/243
https://github.com/ygcaicn/docker-deepin/issues/2
