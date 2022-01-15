FROM ubuntu:latest

# # 使っていない値を指定する
# ENV DISPLAY=:1

# ミラーの変更
RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@' \
      /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt update \
    && apt install -y x11-xserver-utils \
                      xinit \
                      tzdata \
                      language-pack-ja-base \
                      language-pack-ja \
                      sudo \
                      jwm \
                      lxterminal \
                      alsa-utils \
                      pulseaudio \
                      fonts-ipafont-gothic \
                      dbus-x11 \
                      fcitx-mozc \
                      fcitx-imlist \
                      fcitx-googlepinyin \
                      vim-gtk3 \
                      libcurl4 \
                      epiphany-browser \
                      curl \
                      feh \
                      firefox

# RUN curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
#       && apt install -y ./google-chrome-stable_current_amd64.deb \
#       && rm google-chrome-stable_current_amd64.deb
# # 音
# ENV PULSE_SERVER=unix:/tmp/pulse/native \
#     PULSE_COOKIE=/tmp/pulse/cookie

# 日本語
RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8

# タイムゾーン
ENV TZ=Asia/Tokyo

# 日本語入力
ENV GTK_IM_MODULE=fcitx \
    QT_IM_MODULE=fcitx \
    XMODIFIERS=@im=fcitx \
    DefalutIMModule=fcitx

# docker内で使うユーザを作成する。
# ホストと同じUIDにする。
# ホストのpulseaudioのcookieを触るときに、permision deniedにならない。
ARG DOCKER_UID=1000
ARG DOCKER_USER=docker
ARG DOCKER_PASSWORD=docker
RUN useradd -m \
  --uid ${DOCKER_UID} --groups sudo --shell /bin/bash ${DOCKER_USER} \
  && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

WORKDIR /home/${DOCKER_USER}

# jwm(window manager), lxterminal(terminal), bashの設定
RUN curl -L \
  https://raw.githubusercontent.com/atsuya0/dotfiles/master/etc/jwmrc \
  -o ./.jwmrc \
  && mkdir -p ./.config/lxterminal \
  && curl -L \
  https://raw.githubusercontent.com/atsuya0/dotfiles/master/terminal/lxterminal/lxterminal.conf \
  -o ./.config/lxterminal/lxterminal.conf \
  && curl -L \
  https://raw.githubusercontent.com/atsuya0/dotfiles/master/etc/bashrc \
  -o ./.bashrc

RUN chown -R ${DOCKER_USER} ./

USER ${DOCKER_USER}

CMD jwm