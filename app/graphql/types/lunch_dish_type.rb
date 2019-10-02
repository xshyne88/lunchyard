Types::LunchDishType = GraphQL::ObjectType.define do
    name 'LunchDish'
    interfaces [GraphQL::Relay::Node.interface]
    global_id_field :id

    field :lunch_id, types.ID
    field :dish_id, types.ID
    field :quantity, types.Int


    field :dish, Types::DishType do
      resolve -> (obj, args, ctx) {
        Dish.find(obj.dish_id)
      }
    end
    # field :user, Types::UserType, null: false, resolver: Resolvers::UserResolver
  end
