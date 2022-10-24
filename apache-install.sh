#!/bin/bash
#Author: Chinwendu Amarachi Eke
##Date: oct 18 2022
#Description: This will install the web application apache on both RHEL and Fedora operating systems......
#Usage: ./apache-install.sh

echo "starting apache installation shortly, this will take a few minutes..."
sleep 10
echo "..........."
#
echo "Determining OS Version..."
#
DISTRO=$(grep -ioP '^Name=\K.+' /etc/os-release | sed 's/"//g')
UBU='Ubuntu'
RHEL='(CentOS.*)|(Fedora)|(Red Hat.*)'
ORANGE='\033[0;33m'
NOCOLOR='\033[0m'
#
if [[ $DISTRO == $UBU ]]; 
then
	echo "  OS: $DISTRO"
    sleep 5
    echo "<h1>Installing apache2 shortly</h1>"
#
sudo apt update
sudo apt install apache2
sudo ufw allow 'Apache'
sudo ufw status
sudo systemctl enable apache2
sleep 5
sudo systemctl start apache2
sleep 5
sudo systemctl status apache2
#
echo "<h1>SUCCESS</h1>"
#
cd /var/www/html
touch index.html
echo "This trial was successful" >> index.html
echo "<h1> PROCESS COMPLETE </h1>"
#


elif
[[ $DISTRO =~ $RHEL ]]; 
then
echo "  OS: $DISTRO"
    echo "............"
    sleep 5

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
echo "<h1> PROCESS COMPLETE </h1>"
#
else
	echo "<h1>APACHE INSTALLATION FAILED</h1>"
fi
