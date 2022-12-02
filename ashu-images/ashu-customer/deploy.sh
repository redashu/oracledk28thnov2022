#!/bin/bash

if [ "$APP" == "customerapp1" ]
then
    cp -rf  /myapps/webapp1/*  /var/www/html/
    httpd -DFOREGROUND # to start apache httpd service --like systemctl start httpd 
elif [ "$APP" == "customerapp2" ]
then
    cp -rf /myapps/webapp2/*  /var/www/html/
    httpd -DFOREGROUND
else 
    echo "Hello please check your APP variable value " >/var/www/html/index.html
    httpd -DFOREGROUND
fi 