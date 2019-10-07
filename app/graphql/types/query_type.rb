Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
    connection :lunches, Types::LunchType.connection_type do
      argument :sortBy, types.String, 'Column to sort results', as: :sort_by, default_value: 'UPCOMING'
      resolve -> (obj, args, ctx) {
        Lunch.all()
      }
    end

    connection :vendors, Types::LunchType.connection_type do
      resolve -> (obj, args, ctx) {
        Vendor.all()
      }
    end

    connection :dishes, Types::LunchType.connection_type do
      resolve -> (obj, args, ctx) {
        Dish.all()
      }
    end

    field :lunch, Types::LunchType do
      argument :id, types.ID
      resolve -> (obj, args, ctx) {
        Lunch.find(args[:id])
      }
    end

    field :vendor, Types::VendorType do
      argument :id, types.ID
      resolve -> (obj, args, ctx) {
        Vendor.find(args[:id])
      }
    end

    field :dish, Types::DishType do
      argument :id, types.ID
      resolve -> (obj, args, ctx) {
        Dish.find(args[:id])
      }
    end

    field :lunchDish, Types::LunchDishType do
      argument :id, types.ID
      resolve -> (obj, args, ctx) {
        LunchDish.find(args[:id])
      }
    end

    field :user, Types::UserType do
      argument :id, types.ID
      resolve -> (obj, args, ctx) {
        User.find(args[:id])
      }
    end
  end
