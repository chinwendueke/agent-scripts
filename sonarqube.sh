#!/bin/bash
#Author:
#Date:
#Description:Installing sonarqube on centos 7
#This script must be run as a user, else it won't work

user=`whoami`
if [ $user = root ]
then
echo "log in as a regular user"
exit 1
fi

#java installation

sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
if [ $? -eq 0 ]
then 
echo "java has been successfully installed......Hang in for the remaining part of this installation"
sleep 5
echo "......................................"
#
#elif [ $? -ne 0 ]
#then 
#echo "SOMETHING WENT WRONG, PLEASE TRY AGAIN"
#exit 4
#
#else

#Download sonarqube lastest version
cd /opt
sudo yum install wget -y
sleep 5
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sleep 3
echo "SONARQUBE HAS BEEN INSTALLED"
echo "FINISHING THE PROCESS........................................"
#
#Extracting packages
sudo yum install unzip
sleep 5
echo ".............................."
sudo unzip /opt/sonarqube-9.3.0.51899.zip
#
echo "FILE UNZIPPED.............................."
#change ownership
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64 
./sonar.sh start
echo "ALMOST DONE........................."
#
systemctl stop firewalld
systemctl start firewalld
firewall-cmd --permanent --add-service=https
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=ssh
firewall-cmd --permanent --zone=public --add-port=8443/tcp
firewall-cmd --permanent --zone=public --add-port=3389/tcp
firewall-cmd --permanent --zone=public --add-port=2222/tcp
echo "NEXT IS TO OPEN PORT..............PROCESSING................."
#Connect to Sonarqube by opening the port #9000
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
#
else 
echo "CHECK THE SYNTAX AND TRY AGAIN PLEASE"
fi
#
