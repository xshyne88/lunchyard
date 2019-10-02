# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
              {
                first_name: "Ben",
                last_name: "Leeds",
                email: "ben@lunchyard.com",
                birthdate: "5/10/60"
              }
)


Vendor.create([
                {
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

Dish.create([
  {
    name: "Spicy Chicken",
    quantity: 5
  },
  {
    name: "Mild Chicken",
    quantity: 30
  }
])


Lunch.create(
                 vendor_id: 1,
                 user_id: 1,
                 occasion: "birthday",
                 description: "celebration"
)
