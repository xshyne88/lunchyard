require "rails_helper"
require "spec_helper"
require "graphql"

describe "Delete Lunch Mutation API", :graphql do
  describe "deleteLunch" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($id: ID!) {
          deleteLunch(id: $id) {
            id
          }
        }
      GRAPHQL
    end
    let(:lunch) do
      Lunch.first
    end

    it "deletes the specified lunch" do
      # lunch = build(:lunch)
      pp lunch

      result = GraphQLHelpers.execute query, variables: {id: lunch.id}
      pp result

      expect(result[:data][:deleteLunch][:id]).to eq(id)
    end
  end
end
