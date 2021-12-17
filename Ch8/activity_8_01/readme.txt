Create a frontend/backend app.
Frontend app is apache httpd server.
Backend app is nginx server.
Add a clusterIP service to the backend app accessible on port 80.
Add a nodePort service to the frontend app accessible on port 31000.
Add environment variables (IP and port) to the frontend app, so
it can find the IP/port it needs to use to talk to the backend.
5 replicas of the frontend app.
4 replicas of the backend app.
