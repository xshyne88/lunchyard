module Mutations

  class UpdateLunch < BaseMutation
    argument :id, ID, required: true
    argument :occasion, String, required: false
    argument :vendor_id, ID, required: false
    argument :user_id, ID, required: false
    argument :date, String, required: false
    argument :description, String, required: false

    type Types::LunchType

    def required_fields
      %i{id, occasion, vendor_id, date, user_id, description}.map(&:to_s)
    end

    def resolve(id:, **attributes)
      pp attributes
      l = Lunch.find(id)

      # pp "-0----"
      # pp args = prune_required(args)
      l.update!(attributes)

      # l.update!({
      #   vendor_id: args[:vendor_id],
      #   user_id: args[:user_id],
      #   occasion: args[:occasion],
      #   description: args[:description],
      #   date: args[:date],
      # })

      l

    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end

    def prune_required(params)
      params.slice(*required_fields).compact
    end
  end
end
