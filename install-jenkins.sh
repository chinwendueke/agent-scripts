#!/bin/bash
#Author: Amarachi Eke
##Date: oct 2022
#Description: Bash script to install jenkins on ubuntu and RHEL-Based operating systems.
#Usage: ./Install-jenkins.sh

echo "starting Jenkins installation. this will take a few min......"
sleep 15
#
echo "confirming linux version"
sleep 5

DISTRO=$(grep -ioP '^Name=\K.+' /etc/os-release | sed 's/"//g')
UBU='Ubuntu'
RHEL='(CentOS.*)|(Fedora)|(Red Hat.*)'
ORANGE='\033[0;33m'
NOCOLOR='\033[0m'
#
if [[ $DISTRO == $UBU ]]; then 
	echo " OS: $DISTRO"
	sleep 10
#
	echo "............"
sudo apt install openjdk-11-jre -y
java -version
#
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
#
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
#
sudo systemctl start jenkins
sudo systemctl enable jenkins
systemctl status jenkins
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --reload
#
echo "Jenkins is ready please get ip and type it on your browser with your port number"


elif [[ $DISTRO =~ $RHEL ]]; 
then
	echo "  OS: $DISTRO"
	echo "..............."
	echo "Installing EPEL..."
	sleep 30

#sudo yum upgrade
# Add required dependencies for the jenkins package
#sudo yum install java-11-openjdk
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
#
rpm -qa firewalld
sudo yum install firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
#
echo "finishing installattion"
echo ".................."
echo "Jenkins is ready please get ip and type it on your browser with your port number"

else
     echo -e "Operating System is NOT supported. Exiting..............."
     echo " ..........."
	 exit 5
 fi
 #
 read -p "Jenkins has been installed. Press enter key to exit..."
 exit
