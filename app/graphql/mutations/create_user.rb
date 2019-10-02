module Mutations
  class CreateLunch < BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: false
    argument :email, String, required: true
    argument :birthdate, String, required: false

    type Types::UserType

    def resolve(args)
      User.create!({
        first_name: args[:first_name],
        last_name: args[:last_name],
        email: args[:date],
        birthdate: args[:birthdate]
      })
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
