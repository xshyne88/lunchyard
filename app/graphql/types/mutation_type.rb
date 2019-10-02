module Types
  class MutationType < BaseObject
    field :create_lunch, mutation: Mutations::CreateLunch
    field :create_vendor, mutation: Mutations::CreateVendor
    field :create_vendor_dish, mutation: Mutations::CreateDish
    field :add_dish_to_lunch, mutation: Mutations::AddDishToLunch
    # field :remove_dish_from_lunch, mutation: Mutations::RemoveDishFromLunch
    field :delete_lunch, mutation: Mutations::DeleteLunch
    # TODO: updates
  end
end
