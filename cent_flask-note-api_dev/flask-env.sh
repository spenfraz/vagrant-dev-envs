#!/bin/bash

sudo yum -y update
sudo yum -y install git yum-utils

sudo yum -y groupinstall development

sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm

sudo yum -y install python36u

sudo yum -y install python36u-pip
sudo yum -y install python36u-devel

sudo yum -y install wget

sudo wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
sudo yum -y update

sudo yum -y install mysql-server
sudo systemctl start mysqld

sudo mysqladmin -u root password root123

cd /vagrant/

git clone https://github.com/spenfraz/flask-note-api.git

#change ownership (defaults to root)
sudo chown -R vagrant:vagrant flask-note-api/

sudo chmod -R 770 flask-note-api/

