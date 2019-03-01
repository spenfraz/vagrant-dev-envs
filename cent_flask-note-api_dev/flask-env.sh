#!/bin/bash

echo "======= yum update ======="
sudo yum -y update >> /home/vagrant/upstart-log.txt 2>&1

echo "======= install git, yum-utils ======="
sudo yum -y install git yum-utils >> /home/vagrant/upstart-log.txt 2>&1

echo "======= groupinstall development ======="
sudo yum -y groupinstall development >> /home/vagrant/upstart-log.txt 2>&1

# Inline with Upstream Stable
# https://ius.io/
# "IUS is a community project that provides RPM packages for newer 
# versions of select software for Enterprise Linux distributions."
echo "======= install IUS ======="
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm >> /home/vagrant/upstart-log.txt 2>&1

echo "======= install python36u, -pip and -devel ======="
sudo yum -y install python36u python36u-pip python36u-devel >> /home/vagrant/upstart-log.txt 2>&1

echo "======= install wget ======="
sudo yum -y install wget >> /home/vagrant/upstart-log.txt 2>&1

echo "======= download & add MySQL repository,  & update ======="
sudo wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm >> /home/vagrant/upstart-log.txt 2>&1
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm >> /home/vagrant/upstart-log.txt 2>&1
sudo yum -y update >> /home/vagrant/upstart-log.txt 2>&1

echo "======= install and start MySQL service ======="
sudo yum -y install mysql-server >> /home/vagrant/upstart-log.txt 2>&1
sudo systemctl start mysqld >> /home/vagrant/upstart-log.txt 2>&1

echo "======= set MySQL root user password ======="
sudo mysqladmin -u root password root123 >> /home/vagrant/upstart-log.txt 2>&1

echo "======= clone flask-note-api ======="
cd /vagrant/
git clone https://github.com/spenfraz/flask-note-api.git >> /home/vagrant/upstart-log.txt 2>&1

#change ownership (defaults to root)
echo "======= chown & chmod flask-note-api/ ======="
sudo chown -R vagrant:vagrant flask-note-api/ >> /home/vagrant/upstart-log.txt 2>&1
sudo chmod -R 770 flask-note-api/ >> /home/vagrant/upstart-log.txt 2>&1

echo "======= replace csv path in note.sql ======="
cd /vagrant/flask-note-api/
sed -i "s@'/path/to/csv/file.csv'@'/vagrant/flask-note-api/note.csv'@g" note.sql >> /home/vagrant/upstart-log.txt 2>&1

echo "======= initialize MySQL data with note.sql ======="
sudo mysql -u root -proot123 < /vagrant/flask-note-api/note.sql >> /home/vagrant/upstart-log.txt 2>&1

echo "======= replace db connection url in note-server-json.py ======="
sed -i "s$'mysql://<username>:<password>@localhost/notesdb'\$mysql://root:root123@localhost/notesdb'\$g" note-server-json.py >> /home/vagrant/upstart-log.txt 2>&1

echo "======= replace app.run() call with host & port params ======="
sed -i "s/    app.run(debug=True)/    app.run(host=\'0.0.0.0\',port=3000,debug=True)/g" note-server-json.py >> /home/vagrant/upstart-log.txt 2>&1

echo "======= install pip, setuptools, wheel ========"
python3.6 -m pip install --upgrade pip setuptools wheel >> /home/vagrant/upstart-log.txt 2>&1

echo "======= create & activate virtualenv ======="
python3.6 -m venv venv >> /home/vagrant/upstart-log.txt 2>&1
source venv/bin/activate >> /home/vagrant/upstart-log.txt 2>&1

echo "======= install requirements & run ========"
python -m pip install -r requirements.txt >> /home/vagrant/upstart-log.txt 2>&1
python note-server-json.py >> /home/vagrant/upstart-log.txt 2>&1

