module Mutations
  class CreateUser < BaseMutation
    class CreateUserInput < Types::BaseInputObject
      argument :first_name, String, required: true
      argument :last_name, String, required: false
      argument :email, String, required: true
      argument :birthdate, String, required: false
    end

    argument :input, CreateUserInput, required: true

    type Types::UserType

    def resolve(input: input)
      User.create!({
        first_name: input[:first_name],
        last_name: input[:last_name],
        email: input[:date],
        birthdate: input[:birthdate]
      })
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
