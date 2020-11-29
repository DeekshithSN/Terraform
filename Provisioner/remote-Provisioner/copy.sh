#! /bin/bash
UID=$(id -u)
if [ x$UID != x0 ] 
then
    #Beware of how you compose the command
    printf -v cmd_str '%q ' "$0" "$@"
    exec sudo su -c "$cmd_str"
fi

sudo mv /tmp/index.html /var/www/html/
sudo systemctl restart httpd
