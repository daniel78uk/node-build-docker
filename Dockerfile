FROM node:boron-slim

MAINTAINER dan78uk

ENV BUILD_PACKAGES="build-essential unzip curl libaio1 python-minimal git libfontconfig yarn"
ENV NODE_LIBS="node-gyp nsp"

RUN \
  curl -sS http://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -  && \
  echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list  && \
  # apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y $BUILD_PACKAGES && \
  AUTO_ADDED_PACKAGES=`apt-mark showauto` && \
  rm -rf /var/lib/apt/lists/*

RUN \
  npm install -g $NODE_LIBS

WORKDIR /app

CMD [ "node" ]
