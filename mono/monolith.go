package main

import (
	"fmt"
	"net/http"
	"time"
)

func greet(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World! %s", time.Now())
	fmt.Println("enpoint was hit")
}

func main() {
	http.HandleFunc("/", greet)
	fmt.Println("starting on 8080")
	http.ListenAndServe(":8080", nil)
}
