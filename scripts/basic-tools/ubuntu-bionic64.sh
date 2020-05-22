 #!/bin/bash
 

echo "UBUNTU BIONIC64 - BASIC TOOLS"
echo "1. Running apt-update."
sudo apt update -y
echo "2. Installing Basic Tools"
sudo apt install python curl wget net-tools git telnet software-properties-common -y
echo "Done."