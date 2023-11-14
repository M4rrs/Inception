FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

COPY /tools/script.sh /tools/script.sh

EXPOSE 3306

CMD ["/tools/script.sh"]