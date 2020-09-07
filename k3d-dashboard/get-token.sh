#!/bin/bash
#Obtain the Bearer Token
kubectl -n kubernetes-dashboard describe secret admin-user-token | grep ^token