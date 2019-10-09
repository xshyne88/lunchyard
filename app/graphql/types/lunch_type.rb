module Types
  class LunchType < Types::BaseObject
    field :id, ID, null: false
    field :occasion, String, null: true
    field :date, String, null: true
    field :description, String, null: false

    field :user, Types::UserType, null: false
    field :vendor, Types::VendorType, null: false
    field :lunchDishes, Types::LunchDishConnection, null: false

    def user
      User.find(object.user_id)
    end

    def vendor
      Vendor.find(object.user_id)
    end

    def lunch_dishes
      LunchDish.where(lunch_id: object.id).all
    end

  end
end
