module Types
  class VendorType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :address, String, null: true
    # field :last_catered .DateTime

    field :dishes, Types::DishConnection, null: false

    def dishes
      Dish.where(vendor_id: object.id).all
    end
  end
end
