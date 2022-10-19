#!/bin/bash
#Author: Amarachi Eke
##Date: oct 18 2022
#Description: This will install Docker on centos
#Usage: ./docker-install.sh

echo "starting Docker installation shortly, this will take a few minutes..."

yum check-update
yum install yum-utils -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y
yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
systemctl start docker
systemctl enable docker
systemctl status docker
docker run hello-world
