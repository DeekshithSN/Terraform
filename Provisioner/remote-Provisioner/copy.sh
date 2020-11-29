#! /bin/bash
sudo su
sudo mv /tmp/index.html /var/www/html/
sudo systemctl restart httpd
