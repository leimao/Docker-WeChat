# firefox.Dockerfile
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install \
    firefox \
    libcanberra-gtk-module \
    libcanberra-gtk3-module
RUN apt-get clean

RUN apt-get update && apt-get install -y \
        locales \
        locales-all \
        fcitx-libs-dev \
        fcitx-bin \
        fcitx-googlepinyin \
        fcitx \
        fcitx-ui-qimpanel \
        fcitx-sunpinyin \
        dbus-x11 \
        im-config
RUN apt-get clean

RUN apt-get update && apt-get install -y \
        x11-xserver-utils \
        xinit \
        tzdata \
        language-pack-zh* \
        chinese* \
        jwm \
        lxterminal \
        alsa-utils \
        pulseaudio \
        fonts-ipafont-gothic \
        # dbus-x11 \
        # fcitx-mozc \
        # fcitx-imlist \
        vim-gtk3 \
        libcurl4 \
        epiphany-browser \
        curl \
        feh

ENV LC_ALL zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8

ENV GTK_IM_MODULE=fcitx
ENV QT_IM_MODULE=fcitx
ENV XMODIFIERS=@im=fcitx

ENV DISPLAY=:1

# CMD ["firefox"]