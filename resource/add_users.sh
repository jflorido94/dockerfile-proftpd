#!/bin/bash

if [ -n "$FTPD_USERS_LIST" ]; then
	IFS=';' read -r -a parsed_ftp_list <<< "$FTPD_USERS_LIST" ; unset IFS
	for ftp_account in ${parsed_ftp_list[@]}
	do
		IFS=':' read -r -a tab <<< "$ftp_account" ; unset IFS
		ftp_login=${tab[0]}
		ftp_pass=${tab[1]}
		# CRYPTED_PASSWORD=$(perl -e 'print crypt($ARGV[0], "password")' $ftp_pass)
		mkdir /datos/$ftp_login
		# useradd --shell /bin/sh ${USERADD_OPTIONS} -d /home/$ftp_login --password $CRYPTED_PASSWORD $ftp_login
		

		echo $ftp_pass | ftpasswd --stdin --passwd --uid=30 --name ftp_login --home /datos/$ftp_login --shell /bin/false
		
		# chown -R $ftp_login:$ftp_login /datos/$ftp_login
	done
fi

exec "$@"
