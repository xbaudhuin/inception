#!/bin/sh

service mariadb start

sleep 5

mysql -h localhost -u root -p$SQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -h localhost -u root -p$SQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"
mysql -h localhost -u root -p$SQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"
mysql -h localhost -u root -p$SQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"
mysql -h localhost -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysql -h localhost -u root -p$SQL_ROOT_PASSWORD -e "SHOW DATABASES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

mysqld_safe
