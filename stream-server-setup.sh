#!/usr/bin/env bash

#Install dependencies
sudo apt-get install gcc g++ make  build-essential libpcre3  libpcre3-dev libbz2-dev libssl-dev git wget zlib1g-dev libssl-dev ffmpeg 

# Create Folder
mkdir /tmp/nginx-install/

# Download nginx-1.15.9
wget http://nginx.org/download/nginx-1.15.9.tar.gz

# Untar nginx source
tar xf nginx-1.15.9.tar.gz

# Checkout rtmp source
git clone https://github.com/arut/nginx-rtmp-module.git

# Go to nginx source
cd nginx-1.15.9

# configure build
./configure --add-module=/tmp/nginx-install/nginx-rtmp-module --with-http_ssl_module --prefix=/opt/nginx-rtmp

# Build code
sudo make -j4

# Install nginx with rtmp
sudo make install

# Stop server 
sudo /opt/nginx-rtmp/sbin/nginx -s stop

# Check version 
sudo /opt/nginx-rtmp/sbin/nginx -v 