module Mutations
  class DeleteLunch < BaseMutation
    argument :id, ID, required: true
    # argument :last_catered, String, required: true

    type Types::LunchType

    def resolve(args)
      id = args[:id]
      lunch = Lunch.find(id)
      Lunch.destroy(args[:id])

      lunch

    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
