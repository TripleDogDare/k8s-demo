package main

import (
	"fmt"
	"net/http"
	"path"
)

func main() {
	fmt.Println("hello")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %s", path.Base(r.URL.Path))
	})
	http.ListenAndServe(":8080", nil)
}
