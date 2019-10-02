Types::DishType = GraphQL::ObjectType.define do
  name 'Dish'
  interfaces [GraphQL::Relay::Node.interface]
  global_id_field :id

  field :name, !types.String
  field :price, types.String
  field :vendor_id, types.ID
end
