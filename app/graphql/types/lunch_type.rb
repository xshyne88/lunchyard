Types::LunchType = GraphQL::ObjectType.define do
  name 'Lunch'
  interfaces [GraphQL::Relay::Node.interface]
  global_id_field :id

  field :id, !types.ID
  field :occasion, types.String
  field :date, types.String
  field :description, types.String

  field :user do
    type Types::UserType
    resolve -> (obj, args, ctx) {
      User.find(obj.user_id)
    }
  end

  field :vendor, Types::VendorType do
    resolve -> (obj, args, ctx) {
      Vendor.find(obj.vendor_id)
    }
  end

  connection :lunchDishes, Types::LunchDishType.connection_type do
    resolve -> (obj, args, ctx) {

      pp LunchDish.where(lunch_id: obj.id).all
    }
  end
end
# lunches(sortBy: 'UPCOMING') {
#   id
#   occasion
#   date
#   description
#   user {
#     id
#     firstName
#     lastName
#   }
#   vendor {
#     id
#     name
#   }
#   dishes {
#     id
#     name
#     quantity
#     quantityEaten
#   }
# }
# }'
