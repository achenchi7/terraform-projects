#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo mkdir webfiles
cd webfiles
sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page296/browny.zip
sudo unzip browny.zip
sudo find .
cd browny-v1.0
sudo mv * /var/www/html/index.html
cd /var/www/html/index.html
sudo systemctl enable httpd
sudo systemctl start httpd

