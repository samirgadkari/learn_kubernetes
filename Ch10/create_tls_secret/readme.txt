Creating a TLS secret:

Create a set of private-public keys:
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=kube.example.com"

Create a secret using the key/cert:
kubectl -n configmap-test create secret tls test-tls --key="tls.key" --cert="tls.crt"

Check if secret is created:
kubectl -n configmap-test get secrets
kubectl -n configmap-test describe secret test-tls

This secret can be mounted as a volume (check mount-secret-as-volume.yaml).
