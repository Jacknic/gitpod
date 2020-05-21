FROM gitpod/workspace-full

ENV ANDROID_HOME=/home/gitpod/android-sdk-linux \
    ANDROID_SDK_TOOLS="sdk-tools-linux-4333796.zip" \
    ANDROID_SDK_ROOT=${ANDROID_HOME} \
    PATH=$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH

USER gitpod

RUN cd /home/gitpod && \
    wget https://dl.google.com/android/repository/${ANDROID_SDK_TOOLS} -O ${ANDROID_SDK_TOOLS}  && \
    unzip ${ANDROID_SDK_TOOLS} -d ${ANDROID_HOME} && rm ${ANDROID_SDK_TOOLS}