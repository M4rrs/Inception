#!/bin/bash

if [ -f ./wp-config.php ]; then
	echo "WordPress already installed"
else
	cd /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --allow-root	
fi

tail -f /dev/null