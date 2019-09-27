Types::LunchType = GraphQL::ObjectType.define do
  name 'Lunch'

  field :id, !types.ID
  field :rental_type, !types.String
  field :occasion, !types.String
  field :date, !types.String
  field :description, !types.String

  field :user, Types::UserType do
    resolve -> (obj, args, ctx) { obj.user }
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
