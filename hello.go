package main

import (
	"fmt"
	"log"
	"net/http"
	"path"
	"strconv"
	"time"
)

func handler(w http.ResponseWriter, r *http.Request) {
	values := r.URL.Query()
	work := values.Get("work")
	if work_int, err := strconv.Atoi(work); err == nil {
		start := time.Now()
		for time.Since(start) < time.Duration(work_int)*time.Second {
			log.Println(time.Now())
		}
	}

	response := path.Base(r.URL.Path)
	if response == "/" {
		fmt.Fprintf(w, "Hello")
		log.Println("Said hello")
	} else {
		fmt.Fprintf(w, "Hello, %s", response)
		log.Println("Said hello to %s", response)
	}
}

func main() {
	log.Println("ready")
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
