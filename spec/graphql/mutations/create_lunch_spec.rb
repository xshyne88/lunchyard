require "rails_helper"
require "spec_helper"
require "graphql"

module Mutations
  class CreateLunch
    RSpec.describe CreateLunch, type: :request do
      describe ".resolve" do
        it "creates a lunch" do
          expect do
            post "/graphql", params: { query: query() }
          end
        end

        it "returns a lunch" do
          post "/graphql", params: { query: query() }
          json = JSON.parse(response.body)
          pp json
          data = json["data"]["createLunch"]

          expect(data).to include(
            "id" => be_present,
            "occasion" => "Birthday",
            "user" => { "id" => "1" },
            "vendor" => { "id" => "1" },
          )
        end
      end

      def query()
        <<~GQL
          mutation {
           createLunch(occasion: "Birthday", userId: 1, vendorId: 1) {
              id
              occasion
              user {
                id
              }
              vendor {
               id
              }
              }
          }
        GQL
      end
    end
  end
end
