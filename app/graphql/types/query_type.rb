module Types
  class QueryType < Types::BaseObject
    field :lunches, Types::LunchConnection, null: false
    def lunches(**_args)
      Lunch.all()
    end

    field :vendors, Types::VendorConnection, null: false

    def vendors(**_args)
      Vendor.all()
    end

    field :dishes, Types::DishConnection, null: false

    def dishes
      Dish.all()
    end

    field :lunch, Types::LunchType, null: false do
      argument :id, ID, required: false
    end

    def lunch(**args)
      Lunch.find(args[:id])
    end

    field :vendor, Types::VendorType, null: false do
      argument :id, ID, required: true
    end

    def vendor(**args)
      Vendor.find(args[:id])
    end

    field :dish, Types::DishType, null: false do
      argument :id, ID, required: true
    end

    def dish(**args)
      Dish.find(args[:id])
    end

    field :lunchDish, Types::LunchDishType, null: false do
      argument :id, ID, required: true
    end

    def lunch_dish(**args)
      LunchDish.find(args[:id])
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(**args)
      User.find(args[:id])
    end
  end
end
