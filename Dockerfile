# FROM ghcr.io/linuxserver/baseimage-ubuntu:focal
FROM node:current-alpine

WORKDIR /

RUN \
  echo "**** install runtime ****" && \
  apk update && apk add bash

RUN \
  echo "**** install pm2 ****" && \
  npm install pm2 -g

RUN \
  echo "**** clone chia-dashboard ****" && \
  wget -O \
    chia-dashboard-core.tar.gz \
    https://github.com/thauch/chia-dashboard-core/archive/master.tar.gz && \
  tar xf chia-dashboard-core.tar.gz && \
  mv chia-dashboard-core-master chia-dashboard-core && \
  wget -O \
    chia-dashboard-ui.tar.gz \
    https://github.com/thauch/chia-dashboard-ui/archive/master.tar.gz && \
  tar xf chia-dashboard-ui.tar.gz && \
  mv chia-dashboard-ui-master chia-dashboard-ui

RUN \
  echo "**** install chia-dashboard-core ****" && \
  cd chia-dashboard-core && npm install

COPY docker-entrypoint.sh /

RUN ["chmod", "+x", "/docker-entrypoint.sh"]

ENV DATABASE_URL=""
ENV JWT_SIGNING_SECRET=""
ENV GOOGLE_CLIENT_ID=""
ENV GOOGLE_CLIENT_SECRET=""

EXPOSE 5000

ENTRYPOINT [ "/docker-entrypoint.sh" ]

