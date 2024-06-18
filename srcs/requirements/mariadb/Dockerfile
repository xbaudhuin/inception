FROM    debian:bullseye

RUN   apt update -y && apt upgrade -y \
      && apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld /var/lib/mysql \
    && chown -R mysql:mysql /var/run/mysqld /var/lib/mysql \
    && chmod 777 /var/run/mysqld


COPY  ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY  ./conf/mariadb.cnf /etc/mysql/mariadb.cnf

RUN chmod 644  /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.cnf

COPY ./tools/script_mariadb.sh /usr/local/bin/script_mariadb.sh

RUN chmod +x /usr/local/bin/script_mariadb.sh

EXPOSE 3306

ENTRYPOINT   [ "bash", "/usr/local/bin/script_mariadb.sh" ]
