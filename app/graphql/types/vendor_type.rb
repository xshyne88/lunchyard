Types::VendorType = GraphQL::ObjectType.define do
  name 'Vendor'
  interfaces [GraphQL::Relay::Node.interface]
  global_id_field :id

  field :id, !types.ID
  field :name, !types.String
  field :description, !types.String
  field :address, !types.String
  # field :last_catered, !types.DateTime
end
