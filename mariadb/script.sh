#!/bin/bash

service mariadb start
    
mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" 
mysql -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* to '$SQL_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"
tail -f
