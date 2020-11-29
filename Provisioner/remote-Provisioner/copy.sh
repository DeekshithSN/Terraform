#! /bin/bash
sudo su <<EOF
sudo mv /tmp/index.html /var/www/html/
sudo systemctl restart httpd
EOF
