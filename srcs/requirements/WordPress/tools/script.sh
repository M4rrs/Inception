#!/bin/bash

if [ -f ./wp-config.php ]; then
	echo "WordPress already installed"
else
	cd /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --allow-root	

	cp wp-config-sample.php wp-config.php
	sed -i 's/database_name_here/$MYSQL_DATABASE/1' wp-config.php
	sed -i 's/username_here/$MYSQL_USER/1' wp-config.php
	sed -i 's/password_here/$MYSQL_PASSWORD/1' wp-config.php
	sed -i 's/localhost/$WP_LOCALHOST/1' wp-config.php

	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_name=$WP_ADMIN --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=$WP_EMAIL --allow-root
	wp user create $WP_USER	$WP_USER_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root
fi

sed -i 's|/run/php/php7.3-fpm.sock|9000|' /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F

# tail -f /dev/null