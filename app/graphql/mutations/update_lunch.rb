module Mutations

  class UpdateLunch < BaseMutation
    class UpdateLunchInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :occasion, String, required: false
      argument :vendor_id, ID, required: false
      argument :user_id, ID, required: false
      argument :date, String, required: false
      argument :description, String, required: false
    end

    argument :input, UpdateLunchInput, required: true

    type Types::LunchType

    def resolve(input: input)
      l = Lunch.find(input.id)
      l.update!(input.to_h)

      l

    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end

    def prune_required(params)
      params.slice(*required_fields).compact
    end
  end
end
