require 'rails_helper'
require 'spec_helper'
require 'graphql'

module Mutations
  class CreateVendor
    RSpec.describe CreateVendor, type: :request do
    describe '.resolve' do
      it 'creates a vendor' do
        expect do
          post '/graphql', params: { query: query }
        end
      end

      it 'returns a vendor' do
        post '/graphql', params: { query: query }
        json = JSON.parse(response.body)
        data = json['data']['createVendor']

        expect(data).to include(
          'id' => be_present,
          'name' => 'Vendor',
          'description' => 'A Description of a Vendor',
          'address' => 'An Address of a Vendor'
        )
      end
    end

    def query
      <<~GQL
        mutation {
         createVendor(input: {description: "A Description of a Vendor", address: "An Address of a Vendor", name: "Vendor"}) {
           id
           name
           description
           address
          }
        }
      GQL
    end
    end
  end
end
