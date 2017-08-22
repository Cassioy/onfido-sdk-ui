#!/bin/bash

CHROME_VERSION="google-chrome-beta"
CHROME_DRIVER_VERSION=2.31

wget --no-verbose -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
apt-get update -qqy
apt-get -qqy install ${CHROME_VERSION}
rm /etc/apt/sources.list.d/google-chrome.list
rm -rf /var/lib/apt/lists/* /var/cache/apt/*

wget --no-verbose -O /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip
unzip /tmp/chromedriver_linux64.zip -d /opt
chmod 755 /opt/chromedriver
ln -fs /opt/chromedriver /usr/bin/chromedriver
