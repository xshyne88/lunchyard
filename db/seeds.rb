# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{
  first_name: "Ben",
  last_name: "Leeds",
  email: "ben@lunchyard.com",
  birthdate: "5/10/92"
}, {
  first_name: "Chase",
  last_name: "Philips",
  email: "chase@lunchyard.com",
  birthdate: "12/4/88"
}])

Vendor.create([{
  name: "Rocky's Chicken Shack",
  description: "Fried Chicken Shack",
  address: "Rocky's Boulevard",
  last_catered: nil,
},
  {
    name: "Taco Billy",
    description: "Tacos for Days",
    address: "Somewhere in River Arts District",
    last_catered: nil,
  }
])

Dish.create([{
  name: "Spicy Chicken",
  price: "too much money",
  vendor_id: 1
},
  {
    name: "Mild Chicken",
    price: "not enough money",
    vendor_id: 1
  },
  {
    name: "YardBird",
    price: "3 fiddy",
    vendor_id: 2
  },
  {
    name: "SupportGroup",
    price: "2 fiddy",
    vendor_id: 2
  },
])

Lunch.create([{
  vendor_id: 1,
  user_id: 1,
  occasion: "birthday",
  description: "celebration",
  date: Date.new(2020, 1, 1),
},{
  vendor_id: 1,
  user_id: 1,
  occasion: "birthday 2",
  description: "celebration",
  date: Date.new(2019, 12, 04),
  }, {
  vendor_id: 1,
  user_id: 1,
  occasion: "birthday 3",
  description: "celebration",
  date: Date.new(2019, 12, 31),
  }
])
