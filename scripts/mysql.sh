#!/bin/bash

echo -e "\n--- Install MySQL specific packages and settings ---\n"

echo "mysql-server mysql-server/root_password password vagrant"       | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password vagrant" | debconf-set-selections

apt-get -y install mysql-server  libmysqlclient-dev

echo -e "\n--- Setting up our MySQL user and db ---\n"
mysql -uroot -pvagrant -e "CREATE DATABASE dmoj"
mysql -uroot -pvagrant -e "grant all privileges on dmoj.* to 'vagrant'@'localhost' identified by 'vagrant'"

sudo systemctl restart mysql
