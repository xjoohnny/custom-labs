 #!/bin/bash
 

echo "UBUNTU BIONIC64 - APACHE"
echo "1. Running apt-update."
sudo apt update -y
echo "2. Installing Apache"
sudo apt install apache2 -y
echo "3. Starting and enabling service."
sudo systemctl start apache2 && sudo systemctl enable apache2
echo "Done."