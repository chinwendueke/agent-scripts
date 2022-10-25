#!/bin/bash

#Bash shell script that will check all users on the system and display their shell


Names=`cat /etc/passwd |awk -F: '{print$1}'`

for d in $Names;
do 
S=grep $Names /etc/passwd |awk -F: '{print$7}'
