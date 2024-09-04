#!/bin/sh

sed -i -r "s/database_name_here/$WP_DB_NAME/1" /etc/mysql/init.sql
sed -i -r "s/username_here/$WP_DB_USER/" /etc/mysql/init.sql
sed -i -r "s/password_here/$WP_DB_PASSWORD/1" /etc/mysql/init.sql

mysql_upgrade

mysqld
