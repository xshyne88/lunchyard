module Mutations
  class AddDishToLunch < BaseMutation
    argument :lunch_id, ID, required: true
    argument :dish_id, ID, required: true
    argument :quantity, Int, required: false

    type Types::LunchDishType

    def resolve(args)
      LunchDish.create!({
        lunch_id: args[:lunch_id],
        dish_id: args[:dish_id],
        quantity: args[:quantity]
      })
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
