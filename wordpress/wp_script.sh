
#!/bin/bash
cd /var/www/wordpress

wp core download --allow-root

mv wp-config-sample.php wp-config.php

# wp config create	--allow-root \
#     --dbname=$SQL_DATABASE \
#     --dbuser=$SQL_USER \
#     --dbpass=$SQL_PASSWORD \
#     --dbhost=mariadb:3306 --path='/var/www/wordpress'
# mkdir /var/www/
# mkdir /var/www/html
tail -f