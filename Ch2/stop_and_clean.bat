#!/bin/bash
kubectl delete deploy page-counter && kubectl delete service page-counter

# Since we don't have a way of passing a script to the minikube ssh
# command, we cannot issue these commands inside the minikube shell.
# We will have to visit this later.
#
# minicube ssh
# sudo systemctl stop kubelet
# echo 'stopping all containers'; docker stop $(docker ps -aq)
# echo 'removing all containers'; docker rm $(docker ps -aq)
# echo 'check that all containers are removed'; docker ps -a
# echo 'removing all images'; docker rm image $(docker images | awk '{print $3}')
# echo 'check that all images are removed'; docker images
# exit
# minikube stop
