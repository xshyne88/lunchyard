module Types
  class VendorType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :address, String, null: true

    field :dishes, Types::DishConnection, null: false

    field :lunches, Types::LunchConnection, null: false

    def dishes
      Dish.where(vendor_id: object.id).all
    end

    def lunches
      Lunch.where(vendor_id: object.id).all
    end
  end
end
