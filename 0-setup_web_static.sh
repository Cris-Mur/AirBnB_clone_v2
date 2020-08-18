#!/usr/bin/env bash
# Set-up web server
# Update system
sudo apt-get update -y
sudo apt-get upgrade -y
# Install web server
sudo apt-get install nginx
# Create Dirs
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
# fake index.html
sudo touch /data/web_static/releases/test/index.html
echo "Holberton School" | sudo tee /data/web_static/releases/test/index.html
# simbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
# user and group
sudo chown -R ubuntu:ubuntu /data
# Nginx setup
sudo sed -i '/listen 80 default_server;/a location /hbnb_static/ { alias /data/web_static/current/; }' /etc/nginx/sites-available/default
sudo service nginx restart
