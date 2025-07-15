#!/bin/bash

sudo apt update
sudo apt install git -y
git clone https://github.com/huskerjason/raspberry-press.git
cd raspberry-press
bash press-installer.sh

