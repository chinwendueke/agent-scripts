#!/bin/bash
#
OPERS=$(cat /etc/*release | head -4 |tail -1 | awk -F= '{print$2}' | sed 's/"//g')
UB=(Ubuntu)
RHEL='(CentOS.*)|(Fedora)|(Red Hat.*)'
ALP=(Alpine)
ORC=(Oracle)
DEB=(Debian)
#
#
if [ $OPERS = $RHEL ]; then
 
echo "OS: $OPERS"
echo "You got it"
#
sudo yum install finger -y

elif [ $OPERS = $UB ]; then
 
echo "OS: $OPERS"
sudo apt install unzip -y
else 
echo "not working" 
fi
