#!/bin/bash

yum -y update
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y update
echo "[ossim]
gpgcheck=0
humanname=OSSIM-Yum-Repo
baseurl=http://omar.ossim.org/download/CentOS/6/dev/x86_64
name=ossim" > /etc/yum.repos.d/ossim.repo
yum -y install ossim

