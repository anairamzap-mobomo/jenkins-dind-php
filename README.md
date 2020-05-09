# Containerized CI/CD 

Provides: 
- docker:dind (as docker daemon) 
- jenkins (jenkins-blueocean for main/master agent), 
- jenkins ssh agent (with php, composer, rsync and other deps to manage the Acquia deployments in an isolated env)
- nginx proxy (mainly to be able to use TLS / https)
- portainer (to have a lovely web UI to manage containers)

Docs are over here:
