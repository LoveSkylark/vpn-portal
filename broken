ARG VPN-PORTAL_VERSION="1.0.0"
ARG ALPINE_VERSION="3.16"

FROM alpine:${ALPINE_VERSION}
MAINTAINER Skylark 

RUN apk --update --no-cache add \
    python3 \
    py3-qt5 \
    py3-qtwebengine \
    g++ \
    qt5-qtbase \
    libc-dev \
    python3-dev \
    qt5-qtbase-dev \
    py3-pip \
 && pip3 install --upgrade pip \
 && pip3 install --no-cache pyqt5 PyQtWebEngine openconnect-sso --upgrade \
