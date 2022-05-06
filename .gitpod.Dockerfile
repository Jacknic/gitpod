FROM gitpod/workspace-full-vnc
SHELL ["/bin/bash", "-c"]

ENV ANDROID_HOME=/home/gitpod/androidsdk

# Install Open JDK
USER root
RUN apt update \
    && apt install openjdk-8-jdk -y \
    && update-java-alternatives --set java-1.8.0-openjdk-amd64

# Install SDK Manager
USER gitpod
RUN  wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip \
    && mkdir -p $ANDROID_HOME/cmdline-tools/latest \
    && unzip commandlinetools-linux-*.zip -d $ANDROID_HOME \
    && rm -f commandlinetools-linux-*.zip \
    && mv $ANDROID_HOME/cmdline-tools/bin $ANDROID_HOME/cmdline-tools/latest \
    && mv $ANDROID_HOME/cmdline-tools/lib $ANDROID_HOME/cmdline-tools/latest

RUN echo "export ANDROID_HOME=$ANDROID_HOME" >> /home/gitpod/.bashrc \
    && echo 'export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/cmdline-tools/bin:$ANDROID_HOME/platform-tools:$PATH' >> /home/gitpod/.bashrc

# Install Android SDK
USER gitpod
RUN yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "platform-tools" "platforms;android-30"

