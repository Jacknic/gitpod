FROM gitpod/workspace-full-vnc
# https://gist.github.com/pranavavva/a759b5da8bb9323ab5cb7ffd5e0bdc49
USER gitpod

ENV ANDROID_HOME /opt/android-sdk-linux

USER root

RUN apt update -qq && apt install zip unzip

RUN cd /opt && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-8092744_latest.zip && \
    unzip -q *.zip -d ${ANDROID_HOME} && \
    rm *.zip

RUN chmod -R 777 ${ANDROID_HOME}

RUN apt clean -qq

RUN mkdir -p /workspace/ws

USER gitpod

ENV PATH ${PATH}:${ANDROID_HOME}/cmdline-tools/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

