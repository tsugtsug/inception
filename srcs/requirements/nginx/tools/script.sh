#!/bin/bash

sleep 10

mkdir -p /etc/nginx/ssl/

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "$KEY" -out "$CERTS" -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$DOMAIN_NAME"

nginx -g "daemon off;"
