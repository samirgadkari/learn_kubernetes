Promote an app from testing to production, with different config data in
each.

1. Define a namespace called my-app-test
2. Define a ConfigMap named my-app-data. with:
external-system-location=https://testvendor.example.com
external-system-basic-auth-username=user123
3. Define a secret named my-app-secret with:
external-system-basic-auth-password=password123
4. Define a pod spec and deploy the ConfigMap in /etc/app-data folder
   with the filename application-data.properties
5. Define a pod spec and deploy the Secret in the /etc/secure-data
   folder with the filename application-secure.properties
6. Run the pod so that it displays all the content from the ConfigMap
   and Secret
7. Define another namespace: my-app-production
8. Define a ConfigMap named my-app-datain my-app-production with:
external-system-location=https://vendor.example.com
external-system-basic-auth-username=activityapplicationuser
9. Define a Secret named my-app-secret in my-app-production with:
external-system-basic-auth-password=A#4b*(1=B88%tFr3
10. Use the same Pod spec as defined in step 5 and run the pod in
    my-app-production namespace
11. Check that the app displays the correct data

