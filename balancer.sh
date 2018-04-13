#!/bin/bash
sudo apt-get update
sudo add-apt-repository ppa:nginx/stable
sudo apt-get install -y software-properties-common
sudo apt-get update
sudo apt-get install -y nginx
# alter the nginx configuration in /sitew-available/default to have include configuration of servers to be balanced
#  /etc/nginx/sites-enabled/default is a symlink to /etc/nginx/sites-available/default so deleted and recreated later 
sudo rm -rf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
# round robin will be used as the default balancing algorith,
echo "upstream web_servers {
  server 10.0.0.11;
  server 10.0.0.12;
  }
server {
  listen 80;
  location / {
    proxy_set_header  X-Forwarded-For '$proxy_add_x_forwarded_for';
    proxy_pass http://web_servers/;
  }
}" >> /etc/nginx/sites-available/default
#
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
sudo service nginx reload