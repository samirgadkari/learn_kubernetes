echo 'Starting minikube'
minikube start --kubernetes-version=v1.16.2
minikube status
kubectl version --short

echo 'Creating redis pod ...'
kubectl apply -f page-counter-redis-pod.yaml
kubectl get nodes

echo 'Creating redis service ...'
kubectl apply -f page-counter-redis-svc.yaml
kubectl get service 

echo 'Creating page-counter service ...'
kubectl apply -f page-counter-svc.yaml
kubectl get service

echo 'Creating page counter deployment ...'
kubectl apply -f page-counter-deploy.yaml
kubectl get deploy &

echo 'Waiting for page counter deployment ...'
wait
echo ' done'

echo 'Checking page-counter service ...'
minikube service page-counter

# This is not working for some reason.
# We will have to visit this later.
#
# IP_and_port= minikube service page-counter | sed -n 4p | cut -d"|" -f5
# echo 'IP and port: $IP_and_port'
# bash -c 'for i in $(seq 1 30); do curl $IP_and_port; done'
