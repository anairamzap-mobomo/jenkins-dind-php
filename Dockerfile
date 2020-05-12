##
# Jenkins "master" Blueocean.
##
FROM jenkinsci/blueocean as jenkins-master
ENV JENKINS_AGENT_HOME=/var/jenkins_home
USER root

#copy init script and set permissions
COPY jenkins-entrypoint /usr/local/bin/jenkins-entrypoint
RUN chmod +x /usr/local/bin/jenkins-entrypoint

# run image with user jenkins
USER jenkins

# start image with init.sh script
ENTRYPOINT ["/usr/local/bin/jenkins-entrypoint"]
CMD ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
