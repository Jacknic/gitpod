FROM gitpod/workspace-full

# 参考 CircleCI-Public/example-images  https://github.com/CircleCI-Public/example-images/blob/master/android/Dockerfile
ENV ANDROID_SDK_VERSION=sdk-tools-linux-4333796.zip
# 设置环境变量
ENV ANDROID_HOME=/home/gitpod/android-sdk-linux
ENV PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:$PATH

USER gitpod

# 下载安装 Android SDK
RUN mkdir -p ${ANDROID_HOME} && \
    wget -qO ${ANDROID_SDK_VERSION} https://dl.google.com/android/repository/${ANDROID_SDK_VERSION} && \
    unzip -q ${ANDROID_SDK_VERSION} -d ${ANDROID_HOME} && \
    rm ${ANDROID_SDK_VERSION}

USER root
