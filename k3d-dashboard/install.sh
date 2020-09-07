#!/bin/bash
# https://rancher.com/docs/k3s/latest/en/installation/kube-dashboard/
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml
kubectl create -f dashboard.admin-user.yml -f dashboard.admin-user-role.yml