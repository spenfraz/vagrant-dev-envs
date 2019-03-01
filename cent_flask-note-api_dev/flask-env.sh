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

cd /vagrant/flask-note-api/

sed -i "s@'/path/to/csv/file.csv'@'/vagrant/flask-note-api/note.csv'@g" note.sql

sudo mysql -u root -proot123 < /vagrant/flask-note-api/note.sql 

sed -i "s$'mysql://<username>:<password>@localhost/notesdb'\$mysql://root:root123@localhost/notesdb'\$g" note-server-json.py

sed -i "s/    app.run(debug=True)/    app.run(host=\'0.0.0.0\',port=3000,debug=True)/g" note-server-json.py

python3.6 -m pip install --upgrade pip setuptools wheel
python3.6 -m venv venv
source venv/bin/activate

python -m pip install -r requirements.txt
python note-server-json.py

