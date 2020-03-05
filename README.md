# Gitlab CE 
Deploy a gitlab server with docker-compose:
1) LDAP 
2) Let's Encrypt for TLS
3) Custom TLS/Self Signed Certificates
4) SMTP

## Variables 
### |- General configuration 
Value | Description
------------ | -------------
EXTERNAL_URL | The URL of the Gitlab server, example: https://gitlab.mydomain.com
GITLAB_VERSION | Example: latest 
SSH_PORT | Ssh port  
HTTP_PORT | HTTP Port 
HTTPS_PORT | HTTP/S Port

### |- Custom TLS Certificates 
Value | Description
------------ | -------------
CERT_NAME | The filename of the TLS certificate
CERT_KEY_NAME | The filename of the TLS private key. 

