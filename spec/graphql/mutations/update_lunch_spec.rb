require "rails_helper"
require "spec_helper"
require "graphql"

describe "Update Lunch Mutation API", :graphql do
  describe "update lunch" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: UpdateLunchInput!) {
          updateLunch(input: $input) {
            occasion
          }
        }
      GRAPHQL
    end

    it "updates a lunch's occasion" do
      lunch = create(:lunch)

      result = GraphQLHelpers.execute query, variables: {
        input: {
          id: lunch.id,
          occasion: "Updated Occasion"
        },
      }

      expect(result[:data][:updateLunch][:occasion]).to eq("Updated Occasion")
      expect(lunch.reload.occasion).to eq("Updated Occasion")
    end
  end
end
