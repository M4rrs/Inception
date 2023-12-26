#!/bin/bash

# service mysql start

# # echo "FLUSH PRIVILEGES;" | mysql
# echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql
# echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
# echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" | mysql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql
# echo "FLUSH PRIVILEGES;" | mysql

# kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld

echo "USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;" > /tmp/script.sql

Initial db setup
mysql_install_db --user=mysql
mysqld --user=mysql --bootstrap < /tmp/script.sql
mysqld_safe --user=mysql
