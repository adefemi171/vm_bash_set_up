#!/bin/bash -x
echo "This script is written to work with Ubuntu image and also it assumes you have docker installed"
sleep 3
echo


echo "Update your repository"
sudo apt-get update && sudo apt-get upgrade -y
echo
echo "Install Golang"
sleep 3

wget https://golang.org/dl/go1.15.5.linux-amd64.tar.gz

echo "Unzipping Golang"
sleep 3
tar xvf go1.15.5.linux-amd64.tar.gz

echo "Changing Ownership"
sleep 3
sudo chown -R root:root ./go
sudo mv go /usr/local

echo "Setup Go Environment"
sleep 3
export GOROOT=/usr/local/go 
export GOPATH=$HOME/Projects
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH 

mkdir $HOME/Projects
echo "Verify Installation"
sleep 3
go version
sleep 2
go env

echo "Golang successfully installed"

echo "Install Kind"
sleep 3
GO111MODULE="on" go get sigs.k8s.io/kind@v0.9.0

echo "Confirm Kind Installation"
sleep 3
kind create cluster
sleep 5
kind get clusters

echo "Deleting the cluster"
sleep 3
kind delete cluster

echo "Kind Successfully Installed"