FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# COPY /etc/mysql/my.cnf /etc/mysql/my.cnf
# COPY /tools/script.sh /tools/script.sh

EXPOSE 3306

CMD ["mysqld"]