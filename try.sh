#!/bin/bash
cat /etc/*release | head -4 |tail -1 | awk -F= '{print$2}'
op=`cat /etc/*release | head -4 |tail -1 | awk -F= '{print$2}'`
if [ $op == centos ];
then 
sudo yum install finger
else 
echo "not working" 
fi
