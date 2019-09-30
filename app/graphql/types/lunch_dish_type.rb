Types::LunchDishType = GraphQL::ObjectType.define do
    name 'LunchDish'
    field :lunch_id, types.ID
    field :dish_id, types.ID
    field :quantity, types.Int
    # field :user, Types::UserType, null: false, resolver: Resolvers::UserResolver
  end
