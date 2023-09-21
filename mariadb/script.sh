#!/bin/bash


# sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
# service mariadb start
    
# mariadb -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" 
# mariadb -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
# mariadb -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* to '$SQL_USER'@'%';"
# mariadb -e "FLUSH PRIVILEGES;"

# mysqladmin -u root shutdown
# mysqld_safe



sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"
mysql -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* to '$SQL_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root shutdown

mysqld_safe
# tail -f