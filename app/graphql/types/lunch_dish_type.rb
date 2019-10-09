module Types
  class LunchDishType < Types::BaseObject
    field :lunch_id, ID, null: false
    field :dish_id, ID, null: false
    field :quantity, Int, null: true
    field :dish, Types::DishType, null: false
    def dish
      Dish.find(object.dish_id)
    end
  end
end
