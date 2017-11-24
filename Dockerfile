FROM ubuntu:xenial

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqq sudo net-tools iputils-ping vim tzdata bash-completion \
        pkg-config build-essential git patch automake cmake wget unzip bzip2 cpio gawk bc tree python sed tar gperf libtool \
        sqlite3 libpng16-dev libssl-dev libboost-system-dev libboost-filesystem-dev libboost-thread-dev libboost-program-options-dev && \
    apt-get autoclean && \
    useradd -m chenzilin && \
    echo 'chenzilin ALL=NOPASSWD: ALL' > /etc/sudoers.d/chenzilin

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo 'Asia/Shanghai' >/etc/timezone

USER chenzilin
RUN git config --global user.email "chenzilin115@gmail.com" && \
    git config --global user.name "ZiLin Chen"

RUN cd /home/chenzilin/ && \
    wget -c --no-check-certificate https://codeload.github.com/emweb/wt/zip/4.0.3 -O wt-4.0.3.zip && \
    unzip wt-4.0.3.zip && rm wt-4.0.3.zip && \
    cd wt-4.0.3/ && git init . && git add -A . && git commit -am "initial commit based on v4.0.3"

EXPOSE 80

WORKDIR /home/chenzilin
