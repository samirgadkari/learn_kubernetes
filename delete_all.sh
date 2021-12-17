
kubectl delete ns $(kubectl get namespaces | sed '1d' | awk '{print $1}')
kubectl delete job $(kubectl get jobs | sed '1d' | awk '{print $1}')
kubectl delete cronjob $(kubectl get cronjobs | sed '1d' | awk '{print $1}')
kubectl delete service $(kubectl get services | sed '1d' | awk '{print $1}')

