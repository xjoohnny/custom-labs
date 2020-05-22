#!/bin/bash


echo "CENTOS 7 - HTTPD"
echo "1. Running 'yum update'"
sudo yum update -y
echo "2. Installing Httpd Package"
sudo yum install httpd -y
echo "3. Starting and enabling service."
sudo systemctl start httpd && sudo systemctl enable httpd
echo "Done."