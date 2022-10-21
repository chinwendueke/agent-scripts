#!/bin/bash
#Author: Amarachi Eke
##Date: oct 20 2022
#Description: This will install Docker on ubuntu
#Usage: ./docker-install2.sh

echo "starting Docker installation shortly, this will take a few minutes..."

sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etct/apt/keyrings/docker.gpg -y
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo service docker start
sudo docker run hello-world
