module Mutations
  class CreateLunch < BaseMutation
    class CreateLunchInput < Types::BaseInputObject
      argument :occasion, String, required: true
      argument :vendor_id, ID, required: true
      argument :user_id, ID, required: true
      argument :date, String, required: false
      argument :description, String, required: false
    end

    argument :input, CreateLunchInput, required: true

    type Types::LunchType

    def resolve(input: input)
      Lunch.create!({
        vendor_id: input[:vendor_id],
        user_id: input[:user_id],
        occasion: input[:occasion],
        description: input[:description],
        date: input[:date]
      })
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
