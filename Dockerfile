FROM gmolaire/sbt:1.3.13_14.0.2-jdk-buster

ARG YARN_VERSION=1.22.4

RUN apt-get update && apt-get install -y gnupg2 && \
    apt-get install -y apt-transport-https ca-certificates && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn=${YARN_VERSION}-1 && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    yarn global add gulp

ENV LANG "en_US.UTF-8"
ENV LC_CTYPE "en_US.UTF-8"
ENV TZ=Etc/GMT

WORKDIR /home/lichess
