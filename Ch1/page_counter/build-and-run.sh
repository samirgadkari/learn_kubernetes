#!/bin/bash

# CGO_ENABLED flag is off. CGO is used if go code calls C code.
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o bin/$1

ls -l bin/$1

docker build -t $1:v0.0.2 .
docker tag $1:v0.0.2 samirgadkari/$1:v0.0.2
docker login
docker push samirgadkari/$1:v0.0.2

docker run --name db -d redis
docker run --name $1 --link db:db -p 8080:8080 -d samirgadkari/$1:v0.0.2
