docker-proftpd
==============

Docker run example
------------------
```bash
docker run -d --net host \
	-e FTPD_USERS_LIST="user1:pass1;user2:pass2" \
	-v /path_to_ftp_users:/datos \
	-v /path_to_annonimous_ftp:/srv/ftp \
	jflorido94/proftpd
```

Add Users Method
----------------

```bash
FTPD_USERS_LIST="user1:pass1;userN:passN"
```

Default User
-------------

```bash
name => user
pass => password
```

Allowed Environment variable with default value
------------------------------------------------

```bash
PROFTPD_SERVER_NAME         ="Proftpd Debian" 
PROFTPD_DEFAULT_ROOT        ="~" 
PROFTPD_REQUIRE_VALID_SHELL ="off" 
PROFTPD_FTP_PORT            ="21" 
PROFTPD_PASSIVE_PORTS       ="49000-49099" 
PROFTPD_MASQUERADEADDRESS   ="192.168.100.100" 
FTPD_USERS_LIST             ="user:password"
```
