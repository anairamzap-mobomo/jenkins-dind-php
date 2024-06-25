##
# Jenkins "master" Blueocean.
##
FROM jenkins/jenkins:alpine-jdk21 as jenkins-master
ENV JENKINS_AGENT_HOME=/var/jenkins_home
USER root

#copy init script and set permissions
COPY jenkins-entrypoint /usr/local/bin/jenkins-entrypoint
RUN chmod +x /usr/local/bin/jenkins-entrypoint
RUN chown -R jenkins: /var/jenkins_home

# run image with user jenkins
USER jenkins

# start image with init.sh script
ENTRYPOINT ["/usr/local/bin/jenkins-entrypoint"]
CMD ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
#CMD ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
