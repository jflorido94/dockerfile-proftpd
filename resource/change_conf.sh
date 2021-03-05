#!/bin/bash

# Change proftpd.conf with ENV

update_proftpd_setting() {
  conffile="$1"
  setting="$2"
  value="$3"

  sed -i -e 's#^[ \t]*'"$setting"'[ \t].*$#'"$setting $value"'#' "$conffile"
}

[ -n "$PROFTPD_FTP_PORT" ] && \
  update_proftpd_setting /etc/proftpd/proftpd.conf \
   Port "$PROFTPD_FTP_PORT"

[ -n "$PROFTPD_PASSIVE_PORTS" ] && \
  update_proftpd_setting /etc/proftpd/proftpd.conf \
   PassivePorts "${PROFTPD_PASSIVE_PORTS//-/ }"

[ -n "$PROFTPD_SERVER_NAME" ] && \
  update_proftpd_setting /etc/proftpd/proftpd.conf \
   ServerName "$PROFTPD_SERVER_NAME"

[ -n "$PROFTPD_REQUIRE_VALID_SHELL" ] && \
  update_proftpd_setting /etc/proftpd/proftpd.conf \
   RequireValidShell "$PROFTPD_REQUIRE_VALID_SHELL"

[ -n "$PROFTPD_DEFAULT_ROOT" ] && \
  update_proftpd_setting /etc/proftpd/proftpd.conf \
   DefaultRoot "$PROFTPD_DEFAULT_ROOT"

[ -n "$PROFTPD_MASQUERADEADDRESS" ] && \
  update_proftpd_setting /etc/proftpd/proftpd.conf \
   MasqueradeAddress "$PROFTPD_MASQUERADEADDRESS"

exec "$@"
