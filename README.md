# Gitlab CE 
Deploy a gitlab server with docker-compose:
1) LDAP 
2) Let's Encrypt for TLS
3) Custom TLS/Self Signed Certificates
4) SMTP

## Variables 
### /General configuration 
Value | Description
------------ | -------------
EXTERNAL_URL | To make it easier to get a GitLab instance up and running with minimum number of commands, omnibus-gitlab supports the use of an environment variable EXTERNAL_URL during the package installation. On detecting presence of this environment variable, its value will be written as external_url in the gitlab.rb file as part of package installation (or upgrade).
GITLAB_VERSION | latest 
SSH_PORT | 2222
HTTP_PORT | 80 
HTTPS_PORT | 8080
