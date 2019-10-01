Types::LunchType = GraphQL::ObjectType.define do
  name 'Lunch'
  # implements GraphQL::Relay::Node.interface
  global_id_field :id

  field :id, !types.ID
  field :occasion, types.String
  field :date, types.String
  field :description, types.String

  # field :user do
  #   type Types::UserType
  #   resolve -> (x) {
  #     User.first()
  #   }
  # end
end
  # field :vendor, Types::UserType do
  #   resolve -> (obj, args, ctx) {
  #     pp "sup"
  #     pp obj
  #     Vendor.first()
  #   }
  # end
  
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
