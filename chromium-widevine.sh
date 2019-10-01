#!/bin/sh -x
# Only tested on Debian-9 (stretch)
# Assumes sudo pre-configured

###############################################
# Install required packages
###############################################
sudo apt-get -y install wget unzip chromium

###############################################
# Setup build directory
###############################################
mkdir ~/tmp-widevine/
cd ~/tmp-widevine/


###############################################
# Get latest chromium-widevine package
###############################################
wget https://dl.google.com/widevine-cdm/versions.txt
wget https://dl.google.com/widevine-cdm/`tail -n 1 versions.txt`-linux-x64.zip
unzip `tail -n 1 versions.txt`-linux-x64.zip

###############################################
# Install chromium-widevine package
###############################################
sudo mkdir /usr/lib/chromium/
sudo mv libwidevinecdm.so /usr/lib/chromium/libwidevinecdm.so
sudo chmod 644 /usr/lib/chromium/libwidevinecdm.so 


###############################################
# Cleanup build directory
###############################################
rm -r ~/tmp-widevine/
