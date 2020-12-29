FROM ubuntu:latest

ARG NODE_VERSION=14
ARG NEWMAN_VERSION=5.2.0

RUN if [ ! $(echo $NEWMAN_VERSION | grep -oE "^[0-9]+\.[0-9]+\.[0-9]+$") ]; then \
        echo "\033[0;31mA valid semver Newman version is required in the NEWMAN_VERSION build-arg\033[0m"; \
        exit 1; \
    fi

# Install node
ADD https://deb.nodesource.com/setup_$NODE_VERSION.x /opt/install_node.sh

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y gnupg && \
    bash /opt/install_node.sh && \
    apt-get install -y nodejs && \
    npm install -g newman@${NEWMAN_VERSION} newman-reporter-htmlextra newman-reporter-slack && \
    rm /opt/install_node.sh && \
    apt-get purge -y gnupg;

ENV LC_ALL="en_US.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"

WORKDIR /etc/newman

ADD files/ .
ENTRYPOINT ["test.sh"]