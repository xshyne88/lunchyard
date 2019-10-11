module Mutations
  class UpdateVendor < BaseMutation
    class UpdateVendorInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :description, String, required: false
      argument :address, String, required: false
    end

    argument :input, UpdateVendorInput, required: true

    type Types::VendorType

    def resolve(input:)
      v = Vendor.find(input.id)
      v = v.update!(input.to_h)
      v
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
