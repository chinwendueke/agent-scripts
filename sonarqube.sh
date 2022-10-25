#!/bin/bash
#Author:
#Date:
#Description:

su - vagrant

#java installation

sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y

#Download sonarqube lastest version
cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

#Extracting packages
sudo yum install unzip
sudo unzip /opt/sonarqube-9.3.0.51899.zip


#change ownership
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64 
./sonar.sh start

#Connect to Sonarqube by opening the port #9000
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload










