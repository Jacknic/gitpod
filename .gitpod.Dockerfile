FROM gitpod/workspace-full

ENV ANDROID_HOME=/home/gitpod/android-sdk-linux \
    ANDROID_SDK_TOOLS="sdk-tools-linux-4333796.zip" \
    PATH=$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH

USER gitpod

RUN cd /home/gitpod && \
    wget --output-document=${ANDROID_SDK_TOOLS} --quiet https://dl.google.com/android/repository/${ANDROID_SDK_TOOLS} && \
    unzip -d ${ANDROID_HOME} ${ANDROID_SDK_TOOLS} && rm ${ANDROID_SDK_TOOLS};