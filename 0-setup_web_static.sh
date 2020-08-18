#!/usr/env bash
# Set-up web server
# Update system
sudo apt-get update -y
sudo apt-get upgrade -y
# Install web server
sudo apt-get install nginx
# Create Dirs
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
# fake index.html
touch /data/web_static/releases/test/index.html
echo "Holberton School" > /data/web_static/releases/test/index.html
# simbolic link
ln -sf /data/web_static/releases/test/ /data/web_static/current
# user and group
sudo chown -R ubuntu:ubuntu /data
# Nginx setup
sudo sed -i '/listen 80 default_server;/a location /hbnb_static/ { alias /data/web_static/current/; }' /etc/nginx/sites-available/default
sudo service nginx restart
