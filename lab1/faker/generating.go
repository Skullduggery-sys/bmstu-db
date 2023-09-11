package faker
type User struct {
	Nickname string
	Name     string
	Surname  string
	Email    string
	Password string
}

type

type Category string

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
