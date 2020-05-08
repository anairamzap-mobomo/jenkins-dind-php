FROM jenkins/ssh-slave:latest

ARG JENKINS_AGENT_HOME=/var/jenkins_home

# Install selected extensions and other stuff
#We need docker to run bin/composer thingy.
RUN  curl -sSL https://get.docker.com/ | sh
#php
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php-cli \
    php-xdebug \ 
    composer \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY id_rsa /home/jenkins/.ssh/
COPY id_rsa.pub /home/jenkins/.ssh/
