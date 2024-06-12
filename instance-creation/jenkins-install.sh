#!/bin/bash


##curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

echo "[jenkins]
name=Jenkins-stable
baseurl=http://pkg.jenkins.io/redhat-stable
gpgcheck=1" > /etc/yum.repos.d/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key 
yum install fontconfig java-17-openjdk -y
sudo dnf install jenkins -y
systemctl daemon-reload 
systemctl enable jenkins
systemctl start jenkins
systemctl status jenkins