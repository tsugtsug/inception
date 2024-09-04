#!/bin/bash

sleep 10

mkdir -p /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /wp-config.php /var/www/html/wp-config.php

sed -i -r "s/database_name_here/$WP_DB_NAME/1"   wp-config.php
sed -i -r "s/username_here/$WP_DB_USER/1"  wp-config.php
sed -i -r "s/password_here/$WP_DB_PASSWORD/1"    wp-config.php
sed -i -r "s/localhost/$WP_DB_HOST/1"	wp-config.php

wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root

wp user create "$WP_USER" "$WP_USER_EMAIL" --user_pass="$WP_USER_PASSWORD" --role=author --allow-root

php-fpm7.4 -F

