FROM gentilhommefx/android-sdk:24.4.1
MAINTAINER François-Xavier Gentilhomme <gentilhomme.fx@outlook.com>

RUN curl --silent --location https://deb.nodesource.com/setup_6.x | bash - && \
   	apt update && \
	apt install -y nodejs && \
   	apt-get clean autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH ${PATH}:${JAVA_HOME}/bin'

ARG APPIUM_VERSION=1.6.0
RUN npm install -q -g appium@$APPIUM_VERSION
RUN npm install -q -g appium-doctor

RUN appium-doctor --android
