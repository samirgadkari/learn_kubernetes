Create pods:
  - arbitrary-production-application (owner: product-development,
    environment: production, non-critical)
  - infra-libraries-application (owner: infra-libraries, 
    environment: production, critical)
  - infra-libraries-application-staging (owner: infra-libraries,
    environment: staging, dont indicate criticality)

Also add product-development and infra-libraries team links.

Create pods in a different namespace.
  kubectl create namespace activity-6-01 # Create new namespace
  Put in pod's yaml file: metadata > namespace: activity-6-01
Group all pods that run in the production environment and are critical
  kubectl --namespace activity-6-01 get pod -l environment=production,priorityClassName=system-node-critical
Group all pods that are not critical among all environments.
  kubectl --namespace activity-6-01 get pod -l 'priorityClassName notin (system-node-critical)'

