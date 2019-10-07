module Mutations
  class CreateVendor < BaseMutation
    class CreateVendorInput < Types::BaseInputObject
    argument :name, String, required: true
    argument :description, String, required: true
    argument :address, String, required: true
    # argument :last_catered, String, required: true
    end

    argument :input, CreateVendorInput, required: true

    type Types::VendorType

    def resolve(input: input)
      Vendor.create!({
        name: input[:name],
        description: input[:description],
        address: input[:address],
      })
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
