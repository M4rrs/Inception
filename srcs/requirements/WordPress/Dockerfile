FROM debian:buster

# Install WordPress
RUN apt-get update && apt-get install -y \
		php \
		php-fpm \
		php-mysql \
		php-curl \
		php-gd \
		php-intl \
		php-mbstring \
		php-soap \
		php-xml \
		php-xmlrpc \
		php-zip

COPY /tools/script.sh /tools/script.sh
RUN chmod +x /tools/script.sh

EXPOSE 9000

WORKDIR /var/www/html

CMD ["/tools/script.sh"]