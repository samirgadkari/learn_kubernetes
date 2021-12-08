#!/bin/bash

if [ $# -ne 1 ]; then
	printf "Usage:\n"
	printf "  change-ns-in-current-context.sh new-namespace-name\n"
	exit 1
fi

printf "Current namespaces:\n"
kubectl get namespaces
printf "\n"

current_context=$(kubectl config current-context)
printf "Current context: $current_context\n"
printf "\n"

printf "Changing to namespace $1 in current context\n"
kubectl config set-context $current_context --namespace $1

printf "Checking that the context has changed:\n"
kubectl get pods
