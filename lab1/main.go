package main

import (
	"encoding/csv"
	"fmt"
	"github.com/jaswdr/faker"
	"math/rand"
	"os"
	"strconv"
	"time"
)

var nicknameLen = 20
var passwordLen = 20
var lenUsers = 1500
var lenProducts = 1500
var lenOrders = 1500
var lenReviews = 2500

type Category string

func main() {
	lenCategories := DoCategories("/tmp/categories.csv")
	DoUsers(lenUsers, "/tmp/users.csv")
	lenStatuses := DoStatus("/tmp/statuses.csv")
	DoProducts(lenProducts, lenCategories, "/tmp/products.csv")
	DoOrder(lenOrders, lenStatuses, lenUsers, lenProducts, "/tmp/orders.csv")
	DoReviews(lenReviews, lenUsers, lenProducts, "/tmp/reviews.csv")
}

func DoCategories(filepath string) int {
	file, _ := os.Create(filepath)
	defer file.Close()
	w := csv.NewWriter(file)
	w.Write([]string{"category"})
	defer w.Flush()

	categories := GenCategories()
	for _, v := range categories {
		w.Write([]string{string(v)})
	}

	return len(categories)
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

func DoUsers(n int, filepath string) {
	fake := faker.New()
	file, _ := os.Create(filepath)
	defer file.Close()
	w := csv.NewWriter(file)
	defer w.Flush()
	w.Write([]string{"nickname", "name", "surname", "email", "password"})
	for i := 0; i < n; i++ {
		name := fake.Person().FirstName()
		surname := fake.Person().LastName()
		email := fake.Internet().Email()
		nickname := fake.RandomStringWithLength(nicknameLen)
		password := fake.RandomStringWithLength(passwordLen)
		w.Write([]string{nickname, name, surname, email, password})
	}
}

func DoStatus(filepath string) int {
	file, _ := os.Create(filepath)
	defer file.Close()
	w := csv.NewWriter(file)
	defer w.Flush()

	statuses := []string{"Canceled", "In Work", "Done", "Delivery"}

	w.Write([]string{"status"})
	for _, v := range statuses {
		w.Write([]string{v})
	}

	return len(statuses)
}

func DoProducts(n int, lenCategories int, filepath string) {
	fake := faker.New()
	file, _ := os.Create(filepath)
	defer file.Close()
	w := csv.NewWriter(file)
	defer w.Flush()

	randomizer := rand.New(rand.NewSource(time.Now().UnixNano()))

	w.Write([]string{"name", "description", "price", "categoryID"})
	for i := 0; i < n; i++ {
		name := fake.Beer().Name()
		description := fake.Beer().Hop()
		price := fmt.Sprintf("%.2f", randomizer.Float64()*1000)
		categoryId := strconv.Itoa(randomizer.Intn(lenCategories) + 1)
		w.Write([]string{name, description, price, categoryId})
	}
}

func DoOrder(n int, lenStatuses int, lenUsers int, lenProducts int, filepath string) {
	file, _ := os.Create(filepath)
	defer file.Close()
	w := csv.NewWriter(file)
	defer w.Flush()

	randomizer := rand.New(rand.NewSource(time.Now().UnixNano()))

	w.Write([]string{"time", "statusID", "userID", "productID"})
	for i := 0; i < n; i++ {
		time := generateRandomTimestamp().Format(time.RFC3339Nano)
		statusID := strconv.Itoa(randomizer.Intn(lenStatuses) + 1)
		userID := strconv.Itoa(randomizer.Intn(lenUsers) + 1)
		productID := strconv.Itoa(randomizer.Intn(lenProducts) + 1)
		w.Write([]string{time, statusID, userID, productID})
	}
}

func DoReviews(n int, lenUsers int, lenProducts int, filepath string) {
	fake := faker.New()
	file, _ := os.Create(filepath)
	defer file.Close()
	w := csv.NewWriter(file)
	defer w.Flush()

	randomizer := rand.New(rand.NewSource(time.Now().UnixNano()))

	w.Write([]string{"description", "rating", "userID", "productID"})
	for i := 0; i < n; i++ {
		description := fake.RandomStringWithLength(15)
		rating := strconv.Itoa(randomizer.Intn(5) + 1)
		userID := strconv.Itoa(randomizer.Intn(lenUsers) + 1)
		productID := strconv.Itoa(randomizer.Intn(lenProducts) + 1)
		w.Write([]string{description, rating, userID, productID})
	}
}

func generateRandomTimestamp() time.Time {
	minT := time.Date(2022, 1, 1, 0, 0, 0, 0, time.UTC).Unix()
	maxT := time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC).Unix()
	delta := maxT - minT

	randomUnixTime := minT + rand.Int63n(delta)
	return time.Unix(randomUnixTime, 0)
}
