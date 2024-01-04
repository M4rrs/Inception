#!/bin/bash

cd /mariadb_dir

echo "USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;" > /tmp/script.sql

#Initial db setup
mysql_install_db --user=mysql
mysqld --user=mysql --bootstrap < /tmp/script.sql
mysqld_safe --user=mysql

# tail -f /dev/null