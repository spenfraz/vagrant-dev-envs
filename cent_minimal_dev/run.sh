#!/bin/bash

echo "===== yum update ====="
sudo yum -y update >> /home/vagrant/upstart-log.txt 2>&1

echo "===== install git ====="
sudo yum -y install git >> /home/vagrant/upstart-log.txt 2>&1
