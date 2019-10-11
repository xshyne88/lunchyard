require "rails_helper"
require "spec_helper"
require "graphql"

describe "Update Vendor Mutation API", :graphql do
  describe "update vendor" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: UpdateVendorInput!) {
          updateVendor(input: $input) {
              name
              description
              address
          }
        }
      GRAPHQL
  end

    it "makes a new vendor" do
      vendor = create(:vendor)

      result = GraphQLHelpers.execute query, variables: {
        input: {
            id: vendor.id,
            name: "Updated Vendor",
            description: "Updated Description",
            address: "Updated Address"
        },
      }
      pp result

      vendor_result = result[:data][:updateVendor]
      expect(vendor_result).to include(
        name: "Updated Vendor",
        description: "Updated Description",
        address: "Updated Address"
      )

      expect(vendor.reload).to have_attributes(
        name: "Updated Vendor",
        description: "Updated Description",
        address: "Updated Address"
      )
    end
  end
end
