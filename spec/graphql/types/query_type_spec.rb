require 'rails_helper'
require 'spec_helper'
require 'graphql'

RSpec.describe CreateVendor, type: :request do
  describe '.lunches' do
    it 'returns lunches sorted correctly' do
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
        query {
         lunches(first: 100) {
           id
           name
           description
           address
          }
        }
      GQL
  end
end
