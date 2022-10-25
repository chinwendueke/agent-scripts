#!/bin/bash
#Author: Amarachi Eke
##Date: oct 18 2022
#Description: Bash shell script that will install Docker on RHEL and Fedora operating systems
#Usage: ./docker-install.sh

echo "starting Docker installation shortly, this will take a few minutes......"
sleep 30

cat /etc/*release | head -4 |tail -1 | awk -F= '{print$2}'
op=`cat /etc/*release | head -4 |tail -1 | awk -F= '{print$2}'`
if [ $op == centos ];
then
	echo " OS:$op"
	sleep 10
	echo "................."
	
yum check-update
yum install yum-utils -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y
yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
systemctl start docker
systemctl enable docker
systemctl status docker
docker run hello-world

elif [ $op == ubuntu ]; 
then
	echo "  OS: $op"
	sleep 10
echo "system updates .............."

sudo apt-get update
echo "starting Docker installation shortly, this will take a few minutes..."
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
