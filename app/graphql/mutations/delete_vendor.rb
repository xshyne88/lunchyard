module Mutations
  class DeleteVendor < BaseMutation
    argument :id, ID, required: true
    # argument :last_catered, String, required: true

    type Types::VendorType

    def resolve(args)
      id = args[:id]
      vendor = Vendor.find(id)
      Vendor.destroy(args[:id])

      vendor

    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
