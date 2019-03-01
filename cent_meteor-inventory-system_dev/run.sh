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
