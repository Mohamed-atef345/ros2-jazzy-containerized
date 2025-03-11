FROM ubuntu:24.04

RUN apt-get update && apt-get install -y curl \
    git\
    vim\
    nano\
    iputils-ping\
    tmux\
    x11-utils \
    x11-apps \
    xvfb \
    openssh-server\
    && rm -rf /var/lib/apt/lists/*

RUN locale &&\
    apt-get update && apt-get install -y locales &&\
    locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && export LANG=en_US.UTF-8\
    && locale\
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository universe\
    && apt-get update && apt-get install -y curl\
    && rm -rf /var/lib/apt/lists/*
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg\
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt-get update && apt-get install -y ros-dev-tools\
    && apt-get upgrade -y\
    && apt-get install -y ros-jazzy-desktop\
    && rm -rf /var/lib/apt/lists/*
    RUN useradd -m --shell /bin/bash ros_jazzy && usermod -aG sudo ros_jazzy
    RUN echo "ros_jazzy:123456" | chpasswd &&\
    echo "root:123456" | chpasswd
    USER ros_jazzy

    WORKDIR /home/ros_jazzy




