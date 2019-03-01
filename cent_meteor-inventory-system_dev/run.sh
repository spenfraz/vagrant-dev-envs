#!/bin/bash

cd /home/vagrant/

echo "======= yum update ======="
sudo yum -y update >> /home/vagrant/upstart-log.txt 2>&1

echo "======= install git ======="
sudo yum -y install git >> /home/vagrant/upstart-log.txt 2>&1

echo "======= clone repo ======="
cd /vagrant/
git clone https://github.com/spenfraz/meteor-inventory-system.git >> /home/vagrant/upstart-log.txt 2>&1
cd /home/vagrant/

echo "======= Installing Meteor ======="
curl https://install.meteor.com/ | sh >> /home/vagrant/upstart-log.txt 2>&1

echo "======= cd into meteor-inventory-system ======="
cd /vagrant/meteor-inventory-system/ >> /home/vagrant/upstart-log.txt 2>&1

echo "======= create meteor project files ======="
/usr/local/bin/meteor create . --allow-superuser >> /home/vagrant/upstart-log.txt 2>&1

echo "======= adding dependencies ======="
/usr/local/bin/meteor add accounts-ui accounts-password themeteorchef:jquery-validation session iron:router --allow-superuser >> /home/vagrant/upstart-log.txt 2>&1

echo "======= removing unneeded dependencies ======="
/usr/local/bin/meteor remove autopublish insecure --allow-superuser >> /home/vagrant/upstart-log.txt 2>&1

echo "======= start meteor to init db ======="
/usr/local/bin/meteor --allow-superuser  >> /home/vagrant/upstart-log.txt 2>&1

echo "======= backup .meteor/local/db/ ======="
cp -r /vagrant/meteor-inventory-system/.meteor/local/db/ /vagrant/meteor-inventory-system/.meteor-local-db-backup/  >> /home/vagrant/upstart-log.txt 2>&1

echo "======= move /vagrant/meteor-inventory-system/.meteor/local/db/ to /home/vagrant/db ======="
mv /vagrant/meteor-inventory-system/.meteor/local/db/ /home/vagrant/db/ >> /home/vagrant/upstart-log.txt 2>&1

echo "======== move /vagrant/meteor-inventory-system/.meteor/ to /home/vagrant/.meteor ========"
mv /vagrant/meteor-inventory-system/.meteor/ /home/vagrant/.meteor/

echo "======== create symlink /vagrant/meteor-inventory-system/.meteor/ => /home/vagrant/.meteor/ ========"
ln -s /home/vagrant/.meteor/ /vagrant/meteor-inventory-system/.meteor >> /home/vagrant/upsart-log.txt 2>&1

echo "======= create symlink /vagrant/meteor-inventory-system/.meteor/local/db/ => /home/vagrant/db/ ======="
ln -s /home/vagrant/db/ /vagrant/meteor-inventory-system/.meteor/local/db >> /home/vagrant/upstart-log.txt 2>&1

echo "======= cd /vagrant/meteor-inventory-system/ ======="
cd /vagrant/meteor-inventory-system/ >> /home/vagrant/upstart-log.txt 2>&1

echo "======= copy /vagrant/meteor-inventory-system/node_modules to /home/vagrant/node_modules/ ======="
cp -r /vagrant/meteor-inventory-system/node_modules/ /home/vagrant/node_modules/ >> /home/vagrant/upstart-log.txt 2>&1

echo "======= mv /vagrant/meteor-inventory-system/node_modules to /home/vagrant/old-node_modules/ ======"
mv /vagrant/meteor-inventory-system/node_modules/ /home/vagrant/old-node_modules/ >> /home/vagrant/upstart-log.txt 2>&1

echo "======= create symlink /vagrant/meteor-inventory-system/node_modules => /home/vagrant/node_modules ======="
ln -s /home/vagrant/node_modules/ /vagrant/meteor-inventory-system/node_modules >> /home/vagrant/upstart-log.txt 2>&1
