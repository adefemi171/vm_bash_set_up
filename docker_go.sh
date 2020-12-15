#!/bin/bash
#!/bin/bash -x

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

echo "Docker successfully installed and Enabled"

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
