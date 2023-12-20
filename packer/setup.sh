#!/bin/bash

 echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
systemctl restart sshd.service

yum install httpd php -y


systemctl restart httpd.service php-fpm.service
systemctl enable httpd.service php-fpm.service

