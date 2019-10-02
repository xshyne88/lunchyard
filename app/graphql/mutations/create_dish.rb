module Mutations
  class CreateDish < BaseMutation
    argument :name, String, required: true
    argument :price, String, required: true
    argument :vendor_id, String, required: true

    type Types::DishType

    def resolve(args)
      Dish.create!({
        name: args[:name],
        price: args[:price],
        vendor_id: args[:vendor_id],
      })
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
