#!/bin/bash

rm -Rf /usr/local/chef/
rm -Rf /var/www/html/*
rm -Rf /tmp/*

mysql -u root -e"drop database pdns;"
mysql -u root -e"drop database wordpress;"