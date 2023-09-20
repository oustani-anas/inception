#!/bin/bash

mkdir  -p /var/www/wordpress

cd /var/www/wordpress

wp core download --allow-root

cp wp-config-sample.php wp-config.php
# echo "this infos = $SQL_DATABASE $SQL_PASSWORD $SQL_USER"

wp config set DB_NAME $SQL_DATABASE --allow-root 
wp config set DB_USER $SQL_USER --allow-root 
wp config set DB_PASSWORD $SQL_PASSWORD --allow-root 
wp config set DB_HOST mariadb --allow-root 

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

tail -f