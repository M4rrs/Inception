#!/bin/bash

if [ -f ./wp-config.php ]; then
	echo "WordPress already installed"
else
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core version
fi

tail -f /dev/null