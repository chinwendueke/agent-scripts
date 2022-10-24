#!/bin/bash

    #Author : Chinwendu Eke
    #Date : 23-OCT-2022

## ---------- script that Install some packages in Linux ----RHEL and Fedora flavors-------------

DISTRO=$(grep -ioP '^Name=\K.+' /etc/os-release | sed 's/"//g')
UBU='Ubuntu'
RHEL='(CentOS.*)|(Fedora)|(Red Hat.*)'
ORANGE='\033[0;33m'
NOCOLOR='\033[0m'

if [[ $DISTRO =~ $RHEL ]]; 
then

	echo "  OS: $DISTRO"
	echo ".............."

sudo yum install epel-release -y
sudo yum update -y
sudo yum install finger -y 
sudo yum install curl -y 
sudo yum install zip -y 
sudo yum install vim -y
sudo yum install net-tools -y
sudo yum install sysstat -y
#
echo "Installation is now completed"

elif [[ $DISTRO == $UBU ]]; 
then
echo "  OS: $DISTRO"
    echo ".................."
    echo "  Installing EPEL..."
    sleep 30
sudo apt install epel-release -y
sudo apt update -y
sudo apt install sysstat -y
sudo apt install net-tools -y
sudo apt install vim -y
sudo apt install zip -y
sudo apt install curl -y
sudo apt install finger -y


else
	echo "Something went wrong, Operating systems not supported......please try again"
	echo "..................."

	exit 8
fi
	
