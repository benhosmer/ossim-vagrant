#!/bin/bash

# The CA Authorities have been updated since this box was built.
yum -y update ca-certificates
# OSSIM relies on some packages available in EPEL
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
# Add the ossim repo
cat >/etc/yum.repos.d/ossim.repo <<-EOF
[ossim]
name=OSSIM Repo
baseurl=http://omar.ossim.org/download/CentOS/6/release/x86_64/
enabled=1
EOF
sed 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.conf >> /etc/yum.conf
yum -y update
yum -y install ossim


