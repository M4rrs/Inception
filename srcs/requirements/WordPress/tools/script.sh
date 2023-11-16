#!/bin/bash

if [ -f ./wp-config.php ]; then
	echo "WordPress already installed"
else
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	wp core download
fi