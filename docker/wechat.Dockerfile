FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

# Install package dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        locales \
        locales-all \
        gnupg \
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

# [UbuntuKylin](https://www.ubuntukylin.com/) is a Chinese Ubuntu derivative.
RUN echo "deb http://archive.ubuntukylin.com/ubuntukylin focal-partner main" > /etc/apt/sources.list.d/wechat.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 56583E647FFA7DE7

RUN apt-get update && apt-get install -y --no-install-recommends \
        weixin \
        language-pack-zh* \
        chinese* \
        fonts-wqy-microhei \
        fonts-wqy-zenhei \
        xfonts-wqy
RUN apt-get clean

# ENV XMODIFIERS="@im=fcitx"
# ENV QT_IM_MODULE="fcitx"
# ENV GTK_IM_MODULE="fcitx"

ENV LC_ALL en_US.UTF-8
# ENV LC_ALL zh_CN.UTF-8
ENV LANG en_US.UTF-8
ENV LANG zh_CN.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LANGUAGE zh_CN.UTF-8

ENV GTK_IM_MODULE=fcitx
ENV QT_IM_MODULE=fcitx
ENV XMODIFIERS=@im=fcitx
ENV DefaultIMModule=fcitx

CMD ["weixin", "--no-sandbox"]
