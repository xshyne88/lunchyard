class Types::LunchDishConnection < Types::BaseConnection
  graphql_name "LunchDishConnection"
  edge_type(Types::LunchDishEdgeType)
end
