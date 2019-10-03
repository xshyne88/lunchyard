module Mutations
  class UpdateLunch < BaseMutation
    argument :occasion, String, required: true
    argument :vendor_id, ID, required: true
    argument :user_id, ID, required: true
    argument :date, String, required: false
    argument :description, String, required: false

    type Types::LunchType

    def resolve(args)
      Lunch.find(args[:id])
      Lunch.update!({
        vendor_id: args[:vendor_id],
        user_id: args[:user_id],
        occasion: args[:occasion],
        description: args[:description],
        date: args[:date],
      })
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
