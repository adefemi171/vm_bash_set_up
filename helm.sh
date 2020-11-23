#!/bin/bash -x
echo "This script is written to work with Ubuntu image and also it assumes you have docker installed"
sleep 3
echo


echo "Update your repository"
sudo apt-get update && sudo apt-get upgrade -y
echo
echo "Install Helm"
sleep 3

curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sleep 2

sudo apt-get install apt-transport-https --yes
sleep 2

echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sleep 2

sudo apt-get update
sleep 3

sudo apt-get install helm

echo "Helm Successfully Installed"

sleep 3
echo "Enable stable repository"
helm repo add stable https://charts.helm.sh/stable

sleep 4
echo "Repo added successfully"

helm install nginx-ingress stable/nginx-ingress

sleep 4
echo "nginx-ingress installed successfully successfully"

sleep 2
echo "check release status"
helm status nginx-ingress

sleep 3
echo "See all currently deployed releases"
helm list