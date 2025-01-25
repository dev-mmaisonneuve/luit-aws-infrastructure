#!/bin/bash
# Update packages and install Nginx
sudo yum update -y
sudo amazon-linux-extras enable nginx1
sudo yum install -y nginx

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

