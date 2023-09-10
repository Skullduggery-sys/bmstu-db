package main

type Category string

type User struct {
	nick
}

func (f *Faker) GenCategories() []Category {
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

func (f *Faker) genUser() User {
	f.Fake.RandomStringWithLength(20)
}
