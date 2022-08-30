FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY / /

EXPOSE 3306

RUN service mysql start && mysql < createdb.sql && rm -f createdb.sql

CMD /usr/bin/mysqld_safe