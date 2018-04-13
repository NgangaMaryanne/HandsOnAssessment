#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
#change default html file for each server to contain name of server.
echo " request sent to web server $1" | sudo tee /usr/share/nginx/html/index.html
echo "provision of web sever $1 complete"