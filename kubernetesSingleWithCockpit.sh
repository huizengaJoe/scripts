#!/bin/bash

logfile="/var/log/installKubernetes.log"

yum -y install docker etcd kubernetes >> $logfile 2>&1
 
for SERVICE in docker etcd kube-apiserver kube-controller-manager kube-scheduler kube-proxy kubelet; do 
    systemctl restart $SERVICE >> $logfile 2>&1
    systemctl enable $SERVICE >> $logfile 2>&1
done
 
yum -y install cockpit cockpit-kubernetes >> $logfile 2>&1
systemctl enable cockpit.socket >> $logfile 2>&1
systemctl start cockpit.socket >> $logfile 2>&1
