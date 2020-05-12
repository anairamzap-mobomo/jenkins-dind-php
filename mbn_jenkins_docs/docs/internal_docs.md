# To implement on QA server

1. Build the jenkins-blueocean image and spin it up in order to get the SSh key pair is generated:
   
   ``` bash
   docker-compose -f docker-compose.yml up --force-recreate --build -d jenkins-blueocean
   ```

2. Add the jenkins (@blueocean) SSH pub key to host `.env` file (so it's gets picked by the SSH agent agent) 
   
   ``` bash
   echo "JENKINS_SLAVE_SSH_PUBKEY=$(docker exec -it jenkins-blueocean cat /var/jenkins_home/.ssh/id_rsa.pub)" > .env
   ```

3. Finally, run all services:

   ``` bash
   docker-compose -f docker-compose.yml up --force-recreate -d 
   ```
    If you run `docker ps` now, you should see all our containers running (hopefully!)

3. Get the default Jenkins password from the jenkins-blueocean container (and copy it):

   ```
   docker exec -it jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
   ```

4. Go to jenkins https://jenkins.mobomo.net/ and use the above copied pass to login

5. Configure Jenkins

6. Add all the required plugins (for MBN we are using):
    - GitHub Authentication
    - Docker
    - SSH Agent


# Useful commands 

### For the agent

### For Jenkins

### 