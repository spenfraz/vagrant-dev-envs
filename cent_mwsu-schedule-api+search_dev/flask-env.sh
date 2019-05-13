#!/bin/bash

cd /home/vagrant/

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

echo "=======  add the NodeSource yum repo ======="
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash - >> /home/vagrant/upstart-log.txt 2>&1

echo "======= install Nodejs and npm ======="
sudo yum -y install nodejs >> /home/vagrant/upstart-log.txt 2>&1

echo "======= clone mwsu-schedule-search ======="
git clone https://github.com/spenfraz/mwsu-schedule-search.git  >> /home/vagrant/upstart-log.txt 2>&1

echo "======= clone mwsu-schedule-api ======="
git clone https://github.com/spenfraz/mwsu-schedule-api.git  >> /home/vagrant/upstart-log.txt 2>&1

cd /home/vagrant/mwsu-schedule-api/

echo "======= replace app.run() call with host & port params ======="
sed -i "s/    app.run(debug=True)/    app.run(host=\'0.0.0.0\',port=5000,debug=True)/g" routes.py >> /home/vagrant/upstart-log.txt 2>&1

echo "======= install pip, setuptools, wheel ========"
python3.6 -m pip install --upgrade pip setuptools wheel >> /home/vagrant/upstart-log.txt 2>&1

echo "======= create & activate virtualenv ======="
python3.6 -m venv venv >> /home/vagrant/upstart-log.txt 2>&1
source venv/bin/activate >> /home/vagrant/upstart-log.txt 2>&1

cd /home/vagrant/mwsu-schedule-search/

echo "======= npm install & run ======="
npm install >> /home/vagrant/upstart-log.txt 2>&1
nohup npm start & >> /home/vagrant/upstart-log.txt 2>&1

cd /home/vagrant/mwsu-schedule-api/

echo "======= install requirements & run ========"
python -m pip install -r requirements.txt >> /home/vagrant/upstart-log.txt 2>&1
nohup python routes.py & >> /home/vagrant/upstart-log.txt 2>&1


