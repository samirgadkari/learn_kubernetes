sudo su -
which VirtualBox
curl -Lo minikube https://github.com/kubernetes/minikube/releases/download/v1.5.2/minikube-darwin-amd64 && chmod +x minikube
mv minikube /usr/local/bin
which minikube
minikube version
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.2/bin/darwin/amd64/kubectl && chmod +x kubectl
mv kubectl /usr/local/bin
which kubectl

