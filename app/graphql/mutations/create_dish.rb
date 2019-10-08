module Mutations
  class CreateDish < BaseMutation
    class CreateDishInput < Types::BaseInputObject
    argument :name, String, required: true
    argument :price, String, required: true
    argument :vendor_id, String, required: true
    end

    argument :input, CreateDishInput, required: true

    type Types::DishType

    def resolve(input:)
      Dish.create!({
        name: input[:name],
        price: input[:price],
        vendor_id: input[:vendor_id],
      })
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
