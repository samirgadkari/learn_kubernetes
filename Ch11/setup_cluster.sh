#!/bin/bash

# This is only required once, so we have commented out these commands to run the file
# for the later commands.
# 
# aws iam create-group --group-name kops
# aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --group-name kops
# aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonRoute53FullAccess --group-name kops
# aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess --group-name kops
# aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/IAMFullAccess --group-name kops
# aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonVPCFullAccess --group-name kops
# aws iam create-user --user-name kops
# aws iam add-user-to-group --user-name kops --group-name kops
# aws iam create-access-key --user-name kops

# Already exported in ~/.bashrc
# export BUCKET_NAME="kops-myclusterbucket"
# export CLUSTER_NAME="mycluster.k8s.local"
# export KOPS_STATE_STORE="s3://$BUCKET_NAME"

# For kops to store its state, create an S3 bucket:
aws s3 mb s3://$BUCKET_NAME --region us-west-2        # Create bucket in S3.

# Generate all of the config and store it in the S3 bucket. The "kops create cluster" command
# does not actually create the cluster. You have to issue the "kops update cluster $NAME --yes"
# to actually create the EC2 instances.
kops create cluster --zones us-west-2a,us-west-2b,us-west-2c \
	--master-size=t3.micro --node-size=t3.micro \
	--master-count=3 --kubernetes-version=1.22.5 --name $CLUSTER_NAME

# Create an SSH key to be added to all the master/worker nodes so we can log into them:
kops create secret --name $CLUSTER_NAME sshpublickey admin -i ~/.ssh/id_rsa.pub
# After the cluster is running, you can use this command to login to any node in the cluster:
#   ssh -i ~/.ssh/id_rsa admin@<public_ip_of_instance>

# You can also edit the configuration of the cluster, before you create it using:
#   kops edit cluster $CLUSTER_NAME
# More details of the cluster configuration at:
# https://github.com/kubernetes/kops/blob/master/docs/cluster_spec.md

# This will actually apply the configuration changes - thus creating the cluster.
kops update cluster --name=$CLUSTER_NAME --yes

# To check if the cluster is working properly:
# kops validate cluster 

# kops delete cluster --name ${CLUSTER_NAME} --yes
