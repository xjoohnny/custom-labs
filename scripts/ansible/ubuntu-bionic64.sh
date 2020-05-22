#!/bin/bash


echo "UBUNTU BIONIC64 - ANSIBLE"
echo "1. Adding repository."
sudo apt-add-repository ppa:ansible/ansible -y
echo "2. Running apt update."
apt update -y
echo "3. Installing Ansible Package."
apt install ansible -y
echo "Done."