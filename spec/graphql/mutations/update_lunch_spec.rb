require "rails_helper"
require "spec_helper"
require "graphql"

module Mutations
  class UpdateLunch
    RSpec.describe UpdateLunch, type: :request do
      describe ".resolve" do
        it "updates a lunch" do
          expect do
            post "/graphql", params: { query: query() }
          end
        end

        it "returns a lunch" do
          post "/graphql", params: { query: query() }
          json = JSON.parse(response.body)
          data = json["data"]["updateLunch"]

          expect(data).to include(
            "id" => "1",
            "occasion" => "Birthday1",
        )
        end
      end

      def query()
        <<~GQL
          mutation {
           updateLunch(input: {
             id: 1,
             occasion: "Birthday1"
             }) {
              id
              occasion
          }
        }
        GQL
      end
    end
  end
end
