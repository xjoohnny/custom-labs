#!/bin/bash


echo "CENTOS 7 - NGINX"
echo "1. Installing epel-release"
sudo yum install epel-release -y
echo "2. Installing Nginx Package"
sudo yum install nginx -y
echo "3. Starting and enabling service."
sudo systemctl start nginx && sudo systemctl enable nginx
echo "Done."