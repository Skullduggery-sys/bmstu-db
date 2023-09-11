package main

import (
	"encoding/csv"
	"log"
	"os"
)

type User struct {
	Nickname string
	Name     string
	Surname  string
	Email    string
	Password string
}

type Category string

func main() {
	file, err := os.Create("/tmp/categories.csv")
	if err != nil {
		log.Fatal("can't create categories.csv")
	}

	w := csv.NewWriter(file)
	w.Write([]string{"category"})
	defer w.Flush()

	categories := GenCategories()
	for _, v := range categories {
		w.Write([]string{string(v)})
	}
	file.Close()

	file, err = os.Create("/tmp/products")
	w = csv.NewWriter(file)

}

func GenCategories() []Category {
	return []Category{
		"Clothes",
		"Shoes",
		"Electronics",
		"House and garden",
		"Childen's goods",
		"Beauty and health",
		"Appliances",
		"Sport",
		"Repair",
	}
}

func DoUsers(n int) []Users {
	faker := faker.New
}
