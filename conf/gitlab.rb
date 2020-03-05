## GitLab configuration settings
##! This file is generated during initial installation and **is not** modified
##! during upgrades.
##! Check out the latest version of this file to know about the different
##! settings that can be configured by this file, which may be found at:
##! https://gitlab.com/gitlab-org/omnibus-gitlab/raw/master/files/gitlab-config-template/gitlab.rb.template


## GitLab URL
##! URL on which GitLab will be reachable.
##! For more details on configuring external_url see:
##! https://docs.gitlab.com/omnibus/settings/configuration.html#configuring-the-external-url-for-gitlab
gitlab_rails['ldap_servers'] = YAML.load <<-EOS # remember to close this block with 'EOS' below
##
## 'main' is the GitLab 'provider ID' of this LDAP server
##
main:
  ##
  ## A human-friendly name for your LDAP server. It is OK to change the label later,
  ## for instance if you find out it is too large to fit on the web page.
  ##
  ## Example: 'Paris' or 'Acme, Ltd.'
  ##
  label: 'ldap'

  ##
  ## Example: 'ldap.mydomain.com'
  ##
  host: 'ldap.mydomain.com'

  ##
  ## This port is an example, it is sometimes different but it is always an
  ## integer and not a string.
  ##
  port: 636 # usually 636 for SSL
  uid: 'sAMAccountName' # This should be the attribute, not the value that maps to uid.

  ##
  ## Examples: 'america\\momo' or 'CN=Gitlab Git,CN=Users,DC=mydomain,DC=com'
  ##
  bind_dn: 'CN=Gitlab Git,CN=Users,DC=mydomain,DC=com'
  password: 'pass'

  ##
  ## Encryption method. The "method" key is deprecated in favor of
  ## "encryption".
  ##
  ##   Examples: "start_tls" or "simple_tls" or "plain"
  ##
  ##   Deprecated values: "tls" was replaced with "start_tls" and "ssl" was
  ##   replaced with "simple_tls".
  ##
  ##
  encryption: 'simple_tls'

  ##
  ## Enables SSL certificate verification if encryption method is
  ## "start_tls" or "simple_tls". Defaults to true since GitLab 10.0 for
  ## security. This may break installations upon upgrade to 10.0, that did
  ## not know their LDAP SSL certificates were not setup properly.
  ##
  verify_certificates: true

  ##
  ## Specifies the SSL version for OpenSSL to use, if the OpenSSL default
  ## is not appropriate.
  ##
  ##   Example: 'TLSv1_1'
  ##
  ##
  ssl_version: ''

  ##
  ## Set a timeout, in seconds, for LDAP queries. This helps avoid blocking
  ## a request if the LDAP server becomes unresponsive.
  ## A value of 0 means there is no timeout.
  ##
  timeout: 10

  ##
  ## This setting specifies if LDAP server is Active Directory LDAP server.
  ## For non AD servers it skips the AD specific queries.
  ## If your LDAP server is not AD, set this to false.
  ##
  active_directory: true

  ##
  ## If allow_username_or_email_login is enabled, GitLab will ignore everything
  ## after the first '@' in the LDAP username submitted by the user on login.
  ##
  ## Example:
  ## - the user enters 'jane.doe@example.com' and 'p@ssw0rd' as LDAP credentials;
  ## - GitLab queries the LDAP server with 'jane.doe' and 'p@ssw0rd'.
  ##
  ## If you are using "uid: 'userPrincipalName'" on ActiveDirectory you need to
  ## disable this setting, because the userPrincipalName contains an '@'.
  ##
  allow_username_or_email_login: false

  ##
  ## To maintain tight control over the number of active users on your GitLab installation,
  ## enable this setting to keep new users blocked until they have been cleared by the admin
  ## (default: false).
  ##
  block_auto_created_users: false

  ##
  ## Base where we can search for users
  ##
  ##   Ex. 'ou=People,dc=gitlab,dc=example' or 'DC=mydomain,DC=com'
  ##
  ##
  base: 'ou=People,dc=gitlab,dc=example'

  ##
  ## Filter LDAP users
  ##
  ##   Format: RFC 4515 https://tools.ietf.org/search/rfc4515
  ##   Ex. (employeeType=developer)
  ##
  ##   Note: GitLab does not support omniauth-ldap's custom filter syntax.
  ##
  ##   Example for getting only specific users:
  ##   '(&(objectclass=user)(|(samaccountname=momo)(samaccountname=toto)))'
  ##
  user_filter: ''

  ##
  ## LDAP attributes that GitLab will use to create an account for the LDAP user.
  ## The specified attribute can either be the attribute name as a string (e.g. 'mail'),
  ## or an array of attribute names to try in order (e.g. ['mail', 'email']).
  ## Note that the user's LDAP login will always be the attribute specified as `uid` above.
  ##
  attributes:
    ##
    ## The username will be used in paths for the user's own projects
    ## (like `gitlab.example.com/username/project`) and when mentioning
    ## them in issues, merge request and comments (like `@username`).
    ## If the attribute specified for `username` contains an email address,
    ## the GitLab username will be the part of the email address before the '@'.
    ##
    username: ['uid', 'userid', 'sAMAccountName']
    email:    ['mail', 'email', 'userPrincipalName']

    ##
    ## If no full name could be found at the attribute specified for `name`,
    ## the full name is determined using the attributes specified for
    ## `first_name` and `last_name`.
    ##
    name:       'cn'
    first_name: 'givenName'
    last_name:  'sn'

  ##
  ## If lowercase_usernames is enabled, GitLab will lower case the username.
  ##
  lowercase_usernames: false

  ##
  ## EE only
  ##

  ## Base where we can search for groups
  ##
  ##   Ex. ou=groups,dc=gitlab,dc=example
  ##
  group_base: 'ou=groups,dc=gitlab,dc=example'

  ## The CN of a group containing GitLab administrators
  ##
  ##   Ex. administrators
  ##
  ##   Note: Not `cn=administrators` or the full DN
  ##
  admin_group: 'gitlab_admins'

  ## An array of CNs of groups containing users that should be considered external
  ##
  ##   Ex. ['interns', 'contractors']
  ##
  ##   Note: Not `cn=interns` or the full DN
  ##
  external_groups: []

  ##
  ## The LDAP attribute containing a user's public SSH key
  ##
  ##   Example: sshPublicKey
  ##
  sync_ssh_keys: false

## GitLab EE only: add more LDAP servers
## Choose an ID made of a-z and 0-9 . This ID will be stored in the database
## so that GitLab can remember which LDAP server a user belongs to.
#uswest2:
#  label:
#  host:
#  ....
#
EOS

