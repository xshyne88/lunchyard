module Types
  class MutationType < BaseObject
    field :create_lunch, mutation: Mutations::CreateLunch
    field :add_dish_to_lunch, mutation: Mutations::AddDishToLunch
  end
end
