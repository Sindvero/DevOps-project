#!/bin/bash

sudo apt-get update
sudo apt-get install -y default-jdk git
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins
wget http://www.trieuvan.com/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar xvzf 'apache-maven-3.6.3-bin.tar.gz'
sudo cp -r apache-maven-3.6.3/ /home/ubuntu/
sudo systemctl start jenkins
