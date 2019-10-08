module Types
  class DishType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :price, String, null: true
    field :vendor_id, ID, null: false
  end
end
