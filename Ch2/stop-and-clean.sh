#!/bin/bash

# Use this script like this:
#    Issue this command before using this script:
#      kubectl delete deploy page-counter && kubectl delete service page-counter
#    Then, run this command with this script
#      minikube ssh 'bash -s' < this_script_file
#    After everything is done, run the command
#      minikube stop

sudo systemctl stop kubelet
echo 'stopping all containers'; docker stop $(docker ps -aq)
echo 'removing all containers'; docker rm $(docker ps -aq)
echo 'check that all containers are removed'; docker ps -a
echo 'removing all images'; docker rmi $(docker images | awk '{print $3}')
echo 'check that all images are removed'; docker images
exit
