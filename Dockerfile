ARG VPN-PORTAL_VERSION="1.0.0"

FROM ubuntu:22.04
LABEL Maintainer = Skylark 

RUN apt-get update -y

RUN apt-get install -y \
    gnome-keyring \
    xvfb \
    tzdata \
    openconnect

RUN apt-get install -y \
    python3-pip \
    python3-venv \
    python3-pyqt5 \
    libnss3 \
    libasound2 \
    python3-pip

RUN useradd -ms /bin/bash robot && echo "robot:robot" | chpasswd && adduser robot sudo
RUN mkdir -p /home/robot/.config/openconnect-sso
#ADD config.toml /home/robot/.config/openconnect-sso
RUN chown -R robot:robot /home/robot/.config
ENV HOME /home/robot
ENV USER robot
USER robot

RUN echo 'PATH=/home/robot/.local/bin:$PATH' >>.bashrc
RUN pip3 install --user pipx
RUN /home/robot/.local/bin/pipx install "openconnect-sso[full]"
RUN echo pipx ensurepath >>.bashrc