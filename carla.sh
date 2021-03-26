#!/bin/bash

sudo apt update && sudo apt upgrade -y
#https://cloud.google.com/compute/docs/disks/add-persistent-disk
mkdir carla
sudo mount -o discard,defaults /dev/sdb /home/$USER/carla
sudo chmod a+w carla/

cd ~
wget https://download.nomachine.com/download/7.3/Linux/nomachine_7.3.2_1_amd64.deb
sudo dpkg -i no*.deb
rm no*.deb

sudo apt install ubuntu-drivers-common -y
sudo ubuntu-drivers autoinstall

export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive sudo apt install -y lubuntu-desktop

echo "PATH=\$PATH:\$HOME/carla/miniconda/bin" >> ~/.bash_profile
source ~/.bash_profile
conda init bash
source ~/.bashrc

sudo reboot
