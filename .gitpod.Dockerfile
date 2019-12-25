FROM gitpod/workspace-full

USER root

RUN apt-get update && \
    apt-get --quiet install -y wget tar unzip lib32stdc++6 lib32z1 && \
    apt-get clean && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*;

USER gitpod

ENV ANDROID_HOME=/home/gitpod/android-sdk-linux \
    ANDROID_SDK_TOOLS="sdk-tools-linux-4333796.zip" \
    PATH=$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH

RUN cd /home/gitpod && \
    wget --output-document=${ANDROID_SDK_TOOLS} --quiet https://dl.google.com/android/repository/${ANDROID_SDK_TOOLS} && \
    unzip -d ${ANDROID_HOME} ${ANDROID_SDK_TOOLS} && rm ${ANDROID_SDK_TOOLS};