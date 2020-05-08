FROM jenkins/ssh-slave:latest

#ENV JENKINS_AGENT_HOME=/var/jenkins_home

# Install selected extensions and other stuff
#We need docker to run bin/composer thingy.
RUN  curl -sSL https://get.docker.com/ | sh
#PHP for blt/robo, make to run commands from Makefile, git to push to acquia repo.
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php-cli \
    php-xml \ 
    composer \
    build-essential \
    git \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

#USER jenkins
COPY id_rsa /home/jenkins/.ssh/
COPY id_rsa.pub /home/jenkins/.ssh/

RUN chown -R jenkins: /home/jenkins/.ssh

ENV JENKINS_AGENT_HOME=/var/jenkins_home

# Git.
RUN git config --global user.email "jenkins@mobomo.com"
RUN git config --global user.name "jenkins"
