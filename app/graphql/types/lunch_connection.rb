class Types::LunchConnection < Types::BaseConnection
  graphql_name "LunchConnection"
  edge_type(Types::LunchEdgeType)
end
