#!/bin/bash

LOGS_FILE="$1/$(basename "$0").log"

echo -e "\n--- Install MySQL specific packages and settings ---\n"

echo "mysql-server mysql-server/root_password password vagrant"       | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password vagrant" | debconf-set-selections

apt-get -y install mysql-server  libmysqlclient-dev >> "$LOGS_FILE"

echo -e "\n--- Setting up our MySQL user and db ---\n"
mysql -uroot -pvagrant -e "CREATE DATABASE dmoj DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci" >> "$LOGS_FILE"
mysql -uroot -pvagrant -e "grant all privileges on dmoj.* to 'vagrant'@'localhost' identified by 'vagrant'" >> "$LOGS_FILE"

systemctl restart mysql >> "$LOGS_FILE"
