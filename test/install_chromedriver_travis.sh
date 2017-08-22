#!/bin/bash

set -e

CHROME_VERSION="google-chrome-beta"
CHROME_DRIVER_VERSION=2.31

sudo wget --no-verbose -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update -qqy
sudo apt-get -qqy install ${CHROME_VERSION}
sudo rm /etc/apt/sources.list.d/google-chrome.list
sudo rm -rf /var/lib/apt/lists/* /var/cache/apt/*

sudo wget --no-verbose -O /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip
sudo unzip /tmp/chromedriver_linux64.zip -d /opt
chmod 755 /opt/chromedriver
sudo ln -fs /opt/chromedriver /usr/bin/chromedriver
