package main

import (
	"fmt"
	"log"

	"github.com/kelseyhightower/envconfig"
)

type Config struct {
	DatabaseURL string `envconfig:"DATABASE_URL"`
}

func main() {
	var cfg Config
	err := envconfig.Process("", &cfg)
	fmt.Println(cfg)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("fmt")
	log.Println("main")
}
