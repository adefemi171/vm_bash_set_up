#!/bin/bash -x
echo "This script is written to work with Ubuntu image"
sleep 3
echo
echo "Disable swap until next reboot"
echo 
sudo swapoff -a

echo "Update the local node"
sudo apt-get update && sudo apt-get upgrade -y
echo
echo "Install Docker"
sleep 3

sudo apt-get install -y docker.io
echo

echo Enable and Start Docker
sudo systemctl enable docker
sudo systemctl start docker
sleep 3

echo Docker enabled successfully
