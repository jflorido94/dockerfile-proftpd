#!/bin/bash

# Ejecutar aux2.sh
. /aux/add_users.sh

# Ejecutar aux3.sh
. /aux/change_conf.sh

service proftpd start