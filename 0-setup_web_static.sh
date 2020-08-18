#!/usr/bin/env bash
# Set-up web server update server, install nginx make dirs set initial html
# Update system
sudo apt-get -y update
sudo apt-get -y upgrade
# Install web server
sudo apt-get -y install nginx
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
THING='\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n'
sudo sed -i "33 a $THING" /etc/nginx/sites-available/default
sudo nginx -t
sudo service nginx restart
