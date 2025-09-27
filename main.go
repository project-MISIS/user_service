package main

import (
	"fmt"
	"log"
	"net/http"
)

func Handler(w http.ResponseWriter, r *http.Request) {
	_, err := w.Write([]byte("Hello, World"))
	if err != nil {
		log.Fatal("ERROR: failed to write: Hello, World")
	}
}

func main() {
	fmt.Println("Hello world")
	http.HandleFunc("/ping", Handler)
	if http.ListenAndServe("127.0.0.1:80", nil) != nil {
		log.Fatal("ERROR: Failed to start server")
	}
}
