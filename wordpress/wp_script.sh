#!/bin/bash

sleep 10

sed -i -e 's/listen =.*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

cd /var/www/html/wordpress

wp core download --allow-root --path=/var/www/html/wordpress

cp wp-config-sample.php wp-config.php
# echo "this infos = $SQL_DATABASE $SQL_PASSWORD $SQL_USER"

wp config set DB_NAME $SQL_DATABASE --allow-root --path=/var/www/html/wordpress
wp config set DB_USER $SQL_USER --allow-root --path=/var/www/html/wordpress
wp config set DB_PASSWORD $SQL_PASSWORD --allow-root --path=/var/www/html/wordpress
wp config set DB_HOST mariadb --allow-root --path=/var/www/html/wordpress

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root --path=/var/www/html/wordpress
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root --path=/var/www/html/wordpress

mkdir -p /run/php

php-fpm7.4 -F