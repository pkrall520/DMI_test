#!/bin/sh
####################################
# Deploy a test nginx application
#
# Author: Phillip Krall
# Date: Feb 5, 2022
####################################

# Ensure the namespace is always present
kubectl create namespace nginx

# Deploy the nginx application
kubectl apply -f ./k8s/nginx -n nginx
