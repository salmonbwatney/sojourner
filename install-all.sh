#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
echo " "
echo "This might take a while to complete..."
echo "!--------------------------------------!"
echo "!                                      !"
echo "!               Task List              !"
echo "!                                      !"
echo "!--------------------------------------!"
echo "! [X] Install Developer Tools          !"
echo "! [X] Install Image Parsing Packages   !"
echo "! [X] Install Video I/O Packages       !"
echo "! [X] Install GTK                      !"
echo "! [X] Build OpenCV from Source         !"
echo "! [X] Clone Project Git Repo           !"
echo "! [X] Install python requirements      !"
echo "!--------------------------------------!"

sleep (3)

echo "##############################"
echo "# Installing developer tools #"
echo "##############################"

sudo apt-get install build-essential git cmake pkg-config python3

echo " "
