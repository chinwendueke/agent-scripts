#!/bin/bash

#Author : Chinwendu Eke
#Date : Oct 20 2022

#Description: ---------- script that Install some packages in Linux -----------------

sudo apt-get update -y
sudo apt-get install finger -y 
if [ $? -eq 0 ] 
then 
echo "finger installation was successful"
else
echo "installation failed"
sleep 60
fi

sudo apt update
sudo apt install curl -y
if [ $? -eq 0 ]
then
 echo "curl was installed"
else
 echo "installation failed"
sleep 60
fi

sudo apt-get install zip -y
if [ $? -eq 0 ]
then
 echo "zip was installed successfully"
else
 echo "installation failed"
sleep 60
 fi 

sudo apt-get install vim -y
if [ $? -eq 0 ]
then
 echo "vim was installed"
else
 echo "vim installation failed"
 sleep 60
fi

sudo apt-get install net-tools -y
if [ $? -eq 0 ]
then
 echo "net-tools was installed successfully"
else
echo "installation failed"
 sleep 60
fi

sudo apt install sysstat -y
if [ $? -eq 0 ]
then
sudo systemctl enable sysstat
sudo systemctl start sysstat
else
echo "something went wrong with sysstat installation"
sleep 120
exit 5
fi 
sudo apt install epel-release

echo "installations are now completed" 
