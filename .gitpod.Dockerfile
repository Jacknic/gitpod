FROM openjdk:8-jdk-slim

RUN apt-get update \
  && mkdir -p /usr/share/man/man1 \
  && apt-get install -y \
    git mercurial xvfb apt \
    locales sudo openssh-client ca-certificates tar gzip parallel \
    net-tools netcat unzip zip bzip2 gnupg curl wget make

# Use unicode
RUN locale-gen C.UTF-8 || true
ENV LANG=C.UTF-8

USER gitpod
# 参考 CircleCI-Public/example-images  https://github.com/CircleCI-Public/example-images/blob/master/android/Dockerfile

ARG sdk_version=sdk-tools-linux-4333796.zip
# 设置环境变量
ENV ANDROID_HOME=/opt/android/sdk
ENV PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${PATH}

# 下载安装 Android SDK
RUN sudo mkdir -p ${ANDROID_HOME} && \
    curl --silent --show-error --location --fail --retry 3 --output /tmp/${sdk_version} https://dl.google.com/android/repository/${sdk_version} && \
    unzip -q /tmp/${sdk_version} -d ${ANDROID_HOME} && \
    rm /tmp/${sdk_version}

RUN yes | sdkmanager --licenses && yes | sdkmanager --update