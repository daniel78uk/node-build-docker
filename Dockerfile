FROM node:boron-slim

MAINTAINER dan78uk

ENV BUILD_PACKAGES="build-essential unzip curl libaio1 python-minimal git libfontconfig"

RUN echo 'user-agent "npm/v4.0.5 node/v7.4.0 linux x64"' > ~/.yarnrc

RUN apt-get update && \
  apt-get install -y $BUILD_PACKAGES && \
  npm install -g yarn node-gyp nsp && \
  AUTO_ADDED_PACKAGES=`apt-mark showauto` && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD [ "node" ]
