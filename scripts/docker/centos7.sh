#!/bin/bash


echo "CENTOS 7 - DOCKER"
echo "1. Installing dependencies."
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
echo "2. Adding repository."
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
echo "3. Installing Docker Packages."
sudo yum install docker-ce docker-ce-cli containerd.io -y
echo "4. Starting and enabling service."
sudo systemctl start docker && sudo systemctl enable docker
echo "Done."