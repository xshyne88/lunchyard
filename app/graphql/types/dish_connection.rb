class Types::DishConnection < Types::BaseConnection
  graphql_name "DishConnection"
  edge_type(Types::DishEdgeType)
end
