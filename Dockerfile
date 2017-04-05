FROM node:boron-slim

MAINTAINER dan78uk

ENV BUILD_PACKAGES="build-essential unzip curl libaio1 python-minimal git libfontconfig"
ENV NODE_LIBS="yarn node-gyp nsp"

RUN apt-get update && \
  apt-get install -y $BUILD_PACKAGES && \
  AUTO_ADDED_PACKAGES=`apt-mark showauto` && \
  rm -rf /var/lib/apt/lists/*

RUN npm install -g $NODE_LIBS

WORKDIR /app

CMD [ "node" ]
