require "rails_helper"
require "spec_helper"
require "graphql"

describe "Update Vendor Mutation API", :graphql do
  describe "update vendor" do
    let(:updated_name) do
        "Updated Vendor"
    end
    let(:updated_description) do
      "Updated Description"
    end
    let(:updated_address) do
      "Updated Address"
    end

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
      result = execute query, variables: {
        input: {
            id: 1,
            name: updated_name,
            description: updated_description,
            address: updated_address
        },
      }
      pp result

      vendor = result[:data][:updateVendor]
      expect(vendor).to eq({
        "name" => updated_name,
        "description" => updated_description,
        "address" => updated_address
      })
    end
  end
end
