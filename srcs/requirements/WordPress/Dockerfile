FROM debian:buster

RUN apt-get update && apt-get install -y \
		wget \
		vim \
		php \
		php-fpm \
		php-mysql

COPY /tools/script.sh /tools/script.sh
RUN chmod +x /tools/script.sh

EXPOSE 9000

CMD ["tools/script.sh"]