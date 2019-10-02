Types::VendorType = GraphQL::ObjectType.define do
  name 'Vendor'

  field :id, !types.ID
  field :name, !types.String
  field :description, !types.String
  field :address, !types.String
  # field :last_catered, !types.DateTime
end
