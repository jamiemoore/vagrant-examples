#!/bin/bash

#Install requirements
yum install -y haproxy
systemctl start haproxy
systemctl enable haproxy
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --reload


#Deploy Application
cp -af /vagrant/vagrant/haproxy.cfg /etc/haproxy/
systemctl restart haproxy
