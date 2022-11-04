#!/bin/bash
#Author: Amarachi Eke
##Date: oct 18 2022
#Description: Bash shell script that will install Docker on RHEL and Fedora operating systems
#Usage: ./docker-install.sh

echo "starting Docker installation shortly, this will take a few minutes......"
sleep 30

cat /etc/*release | head -4 |tail -1 | awk -F= '{print$2}'
op=`cat /etc/*release | head -4 |tail -1 | awk -F= '{print$2}'`
if [ $op = centos ];
then
	echo " OS:$op"
	sleep 10
#Clean up the system
echo "Clean Up The System......................"	
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
#
#Setup the docker repository
sudo yum install yum-utils -y
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#
#Install the docker engine
sudo yum install docker-ce docker-ce-cli containerd.io -y
#Check the status, start and enable docker daemon
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
docker run hello-world

elif [ $op = ubuntu ]; 
then
	echo "  OS: $op"
	sleep 10
#Clean up the system
sudo apt-get remove docker docker-engine docker.io
#Setup the docker repository
echo "system updates .............."
sudo apt-get update
echo "starting Docker installation shortly, this will take a few minutes..."
#
#Install Docker Engine
 sudo apt install docker.io -y
#
#Install all the dependency packages
sudo snap install docker
#
#Check the status, start and enable docker daemon
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

sudo docker run hello-world
#
else
	echo -e "Operating System is NOT supported. Exiting..............."
	echo " ..........."
	exit 5
fi
