package main

import (
	"fmt"
	"log"
	"net/http"
	"path"
)

func main() {
	log.Println("hello")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %s", path.Base(r.URL.Path))
	})
	log.Fatal(http.ListenAndServe(":8080", nil))
}
