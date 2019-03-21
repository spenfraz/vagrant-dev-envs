#!/bin/bash
echo "======== update yum ======="
sudo yum -y update >> /home/vagrant/upstart-log.txt 2>&1

echo "======== install wget yum-utils ======="
sudo yum -y install wget yum-utils >> /home/vagrant/upstart-log.txt 2>&1

echo "======== install IUM ======"
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm >> /home/vagrant/upstart-log.txt 2>&1

echo "======== download epel-release-latest-7.noarch.rpm ========"
cd /home/vagrant/
sudo wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm >> /home/vagrant/upstart-log.txt 2>&1

echo "======== install epel ======="
sudo rpm -Uvh epel-release-latest-7.noarch.rpm >> /home/vagrant/upstart-log.txt 2>&1

echo "======= install ansible ======"
sudo yum -y install ansible >> /home/vagrant/upstart-log.txt 2>&1

echo "======= copy hosts to /etc/ansible/hosts ======="
sudo mkdir /etc/ansible/ >> /home/vagrant/upstart-log.txt 2>&1
sudo cp /vagrant/hosts /etc/ansible/hosts >> /home/vagrant/upstart-log.txt 2>&1

echo "====== copy keypair.pem to /home/vagrant/ & chown, chmod ======"
cp /vagrant/win-keypair.pem /home/vagrant/.ssh/win-keypair.pem >> /home/vagrant/upstart-log.txt 2>&1
sudo chown vagrant:vagrant /home/vagrant/.ssh/win-keypair.pem >> /home/vagrant/upstart-log.txt 2>&1
sudo chmod 0400 /home/vagrant/.ssh/win-keypair.pem >> /home/vagrant/upstart-log.txt 2>&1
