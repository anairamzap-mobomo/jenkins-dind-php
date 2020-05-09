FROM jenkins/ssh-slave:latest

#ENV JENKINS_AGENT_HOME=/var/jenkins_home

# Install selected extensions and other stuff
#We need docker to run bin/composer thingy.
RUN  curl -sSL https://get.docker.com/ | sh
#PHP + rsync for blt/robo, make to run commands from Makefile, composer to install deps, vim because is great :).
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php-cli \
    php-xml \ 
    build-essential \
    composer \
    rsync \
    vim \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

#USER jenkins
#We copy the ssh keys to the jenkins user home (for git).
COPY id_rsa* /home/jenkins/.ssh/

RUN chown -R jenkins: /home/jenkins/.ssh

ENV JENKINS_AGENT_HOME=/var/jenkins_home

USER jenkins
# Git.
#RUN su jenkins
RUN git config --global user.email "jenkins@mobomo.com" 
RUN git config --global user.name "jenkins"

USER root
