package main

import "github.com/jaswdr/faker"

type Category string

type User struct {
	nickName string
	Name     string
	Surname  string
	email    string
	password string
}


func main() {
	fake := faker.New()
	fake.Address()
}

func genUser() *User {
	fake := faker.New()
	u := &User{}
	u.email = fake.Internet().Email()
	u.nickName = fake.
}

func
