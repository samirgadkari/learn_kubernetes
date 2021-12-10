Create pods:
  - arbitrary-production-application (owner: product-development,
  non-critical)
  - infra-libraries-application (owner: infra-libraries, critical)
  - infra-libraries-application-staging (owner: infra-libraries,
    dont indicate criticality)

Also add product-development and infra-libraries team links.

Create pods in a different namespace.
Group all pods that run in the production environment and are critical
Group all pods that are not critical among all environments.

Create new namespace:
  kubectl create namespace activity-6-01
  
