// main.go
package main

import (
	"fmt"
	"os"
	"time"
)

func main() {
    hostname, _ := os.Hostname()
    fmt.Printf("Hello from monolith executable! Running on: %s\n", hostname)
    fmt.Printf("Started at: %s\n", time.Now().Format(time.RFC1123))
}