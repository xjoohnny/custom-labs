#!/bin/bash


echo "UBUNTU BIONIC64 - DOCKER"
echo "1. Installing dependencies."
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
echo "2. Adding GPG Key."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "3. Adding repository."
sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'
echo "4. Running apt update."
sudo apt update -y
echo "5. Installing Docker Packages."
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
echo "6. Starting and enabling service."
sudo systemctl start docker && sudo systemctl enable docker
echo "Done."