module Mutations
  class AddDishToLunch < BaseMutation
    class AddDishToLunchInput < Types::BaseInputObject
      argument :lunch_id, ID, required: true
      argument :dish_id, ID, required: true
      argument :quantity, Int, required: false
    end

    argument :input, AddDishToLunchInput, required: true

    type Types::LunchDishType

    def resolve(input: input)
      LunchDish.create!({
        lunch_id: input[:lunch_id],
        dish_id: input[:dish_id],
        quantity: input[:quantity]
      })
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
