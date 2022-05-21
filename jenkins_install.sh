#!/bin/bash -x
echo "This script is written to work with Ubuntu image"
sleep 3
echo

echo "Updating and Upgrading image packages"
sudo apt update && sudo apt upgrade -y

sleep 5

echo "add the repository key to the system"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sleep 5

echo "add the repository to the system"
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sleep 5

echo "update the repository"
sudo apt update
sleep 5

echo "Install Java"
sudo apt install openjdk-11-jre-headless -y
sleep 5

echo "install jenkins"
sudo apt install jenkins -y
sleep 5

echo "start jenkins"
sudo systemctl start jenkins
sleep 5

echo "enable jenkins"
sudo systemctl status jenkins
sleep 5

echo "Restart jenkins"
sudo systemctl restart jenkins
sleep 5
echo "done running"

sudo apt install nginx -y

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Send initialAdminPassword to email"
sleep 5
