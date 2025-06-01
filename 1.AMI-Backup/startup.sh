#!/bin/bash
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo chown ubuntu:ubuntu /var/www/html
sudo chmod 777 /var/www/html


