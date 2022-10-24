#!/bin/bash
#Author: Amarachi Eke
##Date: oct 18 2022
#Description: Bash shell script that will install Docker on RHEL and Fedora operating systems
#Usage: ./docker-install.sh

echo "starting Docker installation shortly, this will take a few minutes......"
sleep 30

DISTRO=$(grep -ioP '^Name=\K.+' /etc/os-release | sed 's/"//g')
UBU='Ubuntu'
RHEL='(CentOS.*)|(Fedora)|(Red Hat.*)'
ORANGE='\033[0;33m'
NOCOLOR='\033[0m'

if [[ $DISTRO =~ $RHEL ]];
then
	echo " OS:$DISTRO"
	sleep 20
	echo "................."
	
yum check-update
yum install yum-utils -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y
yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
systemctl start docker
systemctl enable docker
systemctl status docker
docker run hello-world

elif [[ $DISTRO == $UBU ]]; 
then
	echo "  OS: $DISTRO"
	sleep 30
echo "Installing EPEL..."

echo "starting Docker installation shortly, this will take a few minutes..."
echo "......................."

sudo apt-get update
sudo apt install docker.io -y
sudo snap install docker
docker --version
sudo service docker start
sudo docker run hello-world
sudo docker images
sudo docker ps -a
sudo docker ps
#
else
	echo -e "Operating System is NOT supported. Exiting..............."
	echo " ..........."
	exit 5
fi
read -p "Docker has been installed. Press any key to exit..."
exit


