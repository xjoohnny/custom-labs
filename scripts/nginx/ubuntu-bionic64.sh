 #!/bin/bash
 

echo "UBUNTU BIONIC64 - NGINX"
echo "1. Running apt-update."
sudo apt update -y
echo "2. Installing Apache"
sudo apt install nginx -y
echo "3. Starting and enabling service."
sudo systemctl start nginx && sudo systemctl enable nginx
echo "Done."