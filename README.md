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
EXTERNAL_URL | https://gitlab.mydomain.com 
GITLAB_VERSION | latest 
SSH_PORT | 2222
HTTP_PORT | 80 
HTTPS_PORT | 8080
