FROM gitpod/workspace-full

USER gitpod

# 参考 CircleCI-Public/example-images  https://github.com/CircleCI-Public/example-images/blob/master/android/Dockerfile
ARG sdk_version=sdk-tools-linux-4333796.zip
# 设置环境变量
ENV ANDROID_HOME=/home/gitpod/android-sdk-linux
ENV PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${PATH}

# 下载安装 Android SDK
RUN mkdir -p ${ANDROID_HOME} && \
    curl --silent --show-error --location --fail --retry 3 --output ${sdk_version} https://dl.google.com/android/repository/${sdk_version} && \
    unzip -q ${sdk_version} -d ${ANDROID_HOME} && \
    rm ${sdk_version}

RUN yes | sdkmanager --licenses && yes | sdkmanager --update