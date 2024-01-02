FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server vim

COPY /tools/script.sh /tools/script.sh
RUN chmod +x /tools/script.sh

RUN chown -R mysql:mysql /var/lib/mysql
RUN chmod -R 777 /var/lib/mysql/ # Directories
RUN chmod -R 777 /var/lib/mysql/* # Files

RUN mkdir -p /run/mysqld
RUN chown mysql:root /run/mysqld
RUN mkdir -p /mariadb_dir

# bind address 0.0.0.0
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["/tools/script.sh"]