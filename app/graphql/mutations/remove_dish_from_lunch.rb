module Mutations
  class RemoveDishFromLunch < BaseMutation
    argument :id, ID, required: true
    # argument :last_catered, String, required: true

    type Types::LunchDishType

    def resolve(args)
      id = args[:id]
      lunch_dish = LunchDishType.find(id)
      LunchDishType.destroy(args[:id])

      lunch_dish

    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
