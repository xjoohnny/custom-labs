#!/bin/bash


echo "CENTOS 7 - BASIC TOOLS"
echo "1. Installing epel-release."
sudo yum install epel-release -y
echo "2. Running 'yum update'"
sudo yum update -y
echo "3. Installing Basic Tools"
sudo yum install wget curl net-tools bind-utils telnet vim git -y
echo "Done."