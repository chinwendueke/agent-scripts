#!/bin/bash
#Author: Chinwendu Amarachi Eke
##Date: oct 18 2022
#Description: This will install apache, known as httpd on centos
#Usage: ./apache-install.sh

echo "starting apache installation shortly, this will take a few minutes..."

yum update httpd
yum install httpd
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
systemctl start httpd
systemctl enable httpd
systemctl status httpd

cd /var/www/html
touch index.html
echo "This trial was successful" >> index.html
echo "<h1> PROCESS COMPLETE </h1>

