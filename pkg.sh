#!/bin/bash

    #Author : Utrains
    #Date : 01-Nov-2021

## ---------- script that Install some packages in Linux -----------------

yum install finger -y 
if [ $? -eq 0 ] 
then 
echo "finger installation was successful"
else
echo "installation failed"
fi
yum install curl -y 
yum install zip -y 
yum install vim -y
yum install net-tools -y
yum install sysstat -y
yum install epel-release

echo "installation is now completed" 
