#!/bin/bash

echo "===== Update yum ====="
sudo yum -y update >> /home/vagrant/upstart-log.txt 2>&1

echo "===== Install OpenJDK Java 8 ====="
sudo yum -y install java-1.8.0-openjdk-devel >> /home/vagrant/upstart-log.txt 2>&1

echo "===== Install Maven ====="
sudo yum -y install maven >> /home/vagrant/upstart-log.txt 2>&1

echo "===== Install Git ====="
sudo yum -y install git >> /home/vagrant/upstart-log.txt 2>&1

echo "===== Clone schedule-scraper-soup ====="
git clone https://github.com/spenfraz/schedule-scraper-soup.git >> /home/vagrant/upstart-log.txt 2>&1

echo "===== chown all project files (vagrant:vagrant) ===="
sudo chown vagrant:vagrant /home/vagrant/schedule-scraper-soup/ -Rh
