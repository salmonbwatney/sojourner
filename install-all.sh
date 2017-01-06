#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install build-essential git cmake pkg-config -y
sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev -y
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
sudo apt-get install libgtk2.0-dev -y

cd ~
wget -O sojourner.zip --no-check-certificate https://github.com/markwatneyy/sojourner/releases/latest.zip
unzip sojourner.zip
rm sojourner.zip
cd sojourner/Raspi\ Dependancies/opencv/build

sudo make install
