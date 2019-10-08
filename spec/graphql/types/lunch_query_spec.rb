require 'rails_helper'
require 'spec_helper'
require 'graphql'

describe "Lunch Query API", type: :request do
  describe '.lunches' do
    it 'returns lunches sorted by upcoming' do
      result = GraphQLHelpers.execute query, variables: {sortBy: "UPCOMING"}
    end
  end

  def query
    <<~GQL
        query {
         lunches(first: 100) {
           edges {
             node {
               id
               occasion
            }
          }
        }
      }
    GQL
  end
end
