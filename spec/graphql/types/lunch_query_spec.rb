require 'rails_helper'
require 'spec_helper'
require 'graphql'

describe "Lunch Query API", type: :request do
  describe '.lunches' do
    it 'returns lunches sorted by upcoming' do
      result = GraphQLHelpers.execute query, variables: {sortBy: "UPCOMING"}
      pp result


      lunches = result[:data][:lunches][:edges]

      expect(lunches).to match_array(
        [{"node"=>{"id"=>"2", "occasion"=>"birthday 2"}},
          {"node"=>{"id"=>"3", "occasion"=>"birthday 3"}},
          {"node"=>{"id"=>"1", "occasion"=>"birthday"}}]
      )


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
