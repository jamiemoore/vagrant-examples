#!/bin/bash


#Install requirements
yum install -y httpd
systemctl start httpd
systemctl enable httpd
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --reload

#Run Application
echo "<pre>" > /var/www/html/index.html
/opt/vex/vex | tee -a /var/www/html/index.html
echo "</pre>" >> /var/www/html/index.html
