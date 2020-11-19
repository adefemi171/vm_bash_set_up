#!/bin/bash -x
echo "This script is written to work with Ubuntu image"
sleep 3
echo
echo "Disable swap until next reboot"
echo 
sudo swapoff -a

echo "Update your repository"
sudo apt-get update && sudo apt-get upgrade -y
echo
echo "Installing Docker"
sleep 3

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
echo

echo Enable and Start Docker
sudo systemctl enable docker
sudo systemctl start docker
sleep 3

echo "Docker enabled successfully"
sleep 3

echo "Executing Docker without Sudo"
sudo usermod -aG docker $USER

echo "Docker successfully installed"