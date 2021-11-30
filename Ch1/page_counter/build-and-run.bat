# CGO_ENABLED flag is off. CGO is used if go code calls C code.
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o bin/page-counter

ls -l bin/page-counter

docker build -t page-counter:v0.0.1 .

docker run -p 8080:8080 -d page-counter:v0.0.1
