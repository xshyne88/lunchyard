module Mutations
  class UpdateVendor < BaseMutation
    class UpdateVendorInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: true
      argument :address, String, required: true
    end

    argument :input, UpdateVendorInput, required: true

    type Types::VendorType

    def resolve(input:)
      l = Vendor.find(input.id)
      l.update!(input.to_h)
      l

    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
