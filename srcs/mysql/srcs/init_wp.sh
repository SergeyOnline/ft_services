#!/bin/sh

rc default
/etc/init.d/mariadb setup
rc-service mariadb start
echo "create database wordpress;" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; flush privileges;" | mysql

mysql wordpress < wordpress.sql

rc-service mariadb stop
/usr/bin/mysqld_safe
