To create a docker registry secret:

kubectl -n configmap-test create secret docker-registry test-docker-registry-secret --docker-username=test --docker-password=testpassword --docker-email="example@a.com"
kubectl -n configmap-test get secrets test-docker-registry-secret
kubectl -n configmap-test describe secret test-docker-registry-secret
