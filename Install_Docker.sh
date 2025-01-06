#!/bin/bash

# This scrip will setup docker in your Ubuntu system

# Version 1.0
# Author: Dhruv Jain

# Check if docker is already installed or not
check_docker(){
docker --version

if [[$? == 0 ]]
then
        echo "!!!!! docker is already install in your system !!!!!"
        exit 1
else
        echo "Installing Docker"
        Install_Docker
fi
}


# Installing Docker
Install_Docker(){

echo "####### Installing Docker #######"

echo "####### Updating the system #######"
sudo apt-get update

echo "####### Installing Docker #######"
sudo apt install docker.io -y

sleep 2
echo "####### restart docker #######"
sudo systemctl restart docker

sleep 6
echo "####### Enable docker #######"
sudo systemctl enable docker

sleep 4

echo "####### Adding user to docker group #######"
sudo usermod -aG docker $USER

echo "####### Docker is Installed ######"

read -p "Do you want to install docker compose[y/n] : - " Res
if [[ $Res == y ]]
then
        Docker-compose
else
        newgrp docker
        exit 1
fi

}

# Installing Docker-compose
Docker-compose(){
echo "################ Installing docker-compose ##############"

sudo apt-get install docker-compose-v2 -y

echo "################ Docker-compose installed ###############"

newgrp docker
exit 1
}

# Calling the Main function
if ! check_docker; then
        echo "Error in installing docker"
        echo "Install docker manually"
        echo "use the following command to install docker --"
        echo "-----------------------------------------------"
        echo "sudo apt-get update"
        echo "sudo apt-get install docker.io -y"
        echo "sudo systemctl restart docker"
        echo "sudo systemctl enable docker"
        echo "sudo usermod -aG docker $USER"
        echo "newgrp docker"
        exit 1
fi