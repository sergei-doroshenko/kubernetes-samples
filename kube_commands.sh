#!/bin/bash
# deploy using two manifect files
# create deployment
kubectl create -f manifests/greeting-deployment.yaml

# chech resources
kubectl get deployments
kubectl get pods
kubectl logs greeting-56d584b7b-gm8j8

# create service
kubectl create -f manifests/greeting-service.yaml
# check services
kubectl get svc
# call service
curl localhost:8080

# delete resources
kubectl delete -f manifests/greeting-service.yaml
kubectl delete -f manifests/greeting-deployment.yaml

# create from single manifest file
kubectl create -f greeting.yaml
# check all
kubectl get svc,deployments,pods
# delete all
kubectl delete deployment/greeting svc/greeting

