package main

import (
	"fmt"
	"log"
	"net/http"
)

var count int = 1

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe("0.0.0.0:8080", nil))
}

func handler(w http.ResponseWriter, r *http.Request) {
	log.Printf("Ping from %s\n", r.RemoteAddr)
	fmt.Fprintf(w, "Hello, you're visitor #%d\n", count)
	count += 1
}
