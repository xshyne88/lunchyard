module Mutations
  class CreateVendor < BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true
    argument :address, String, required: true
    # argument :last_catered, String, required: true

    type Types::VendorType

    def resolve(args)
      Vendor.create!({
        name: args[:name],
        description: args[:description],
        address: args[:address],
      })
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
