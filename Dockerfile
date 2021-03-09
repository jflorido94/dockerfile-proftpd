FROM debian:stretch-slim

MAINTAINER jflorido94

# Environment variable defaults
ENV PROFTPD_SERVER_NAME="Proftpd Debian" \
    PROFTPD_DEFAULT_ROOT="~" \
    PROFTPD_REQUIRE_VALID_SHELL="off" \
    PROFTPD_FTP_PORT="21" \
    PROFTPD_PASSIVE_PORTS="49000-49099" \
    PROFTPD_MASQUERADEADDRESS="192.168.100.100" \
    FTPD_USERS_LIST="user:password"

# Expose ports
# EXPOSE ${PROFTD_FTP_PORT} 
# EXPOSE ${PROFTPD_PASSIVE_PORTS}

RUN apt-get update && \
	  apt-get install -y proftpd && \
	  apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /datos

COPY resource/proftpd.conf /etc/proftpd/proftpd.conf
COPY resource /aux

RUN chmod -R 777 /aux

RUN /aux/execute.sh

RUN service proftpd start