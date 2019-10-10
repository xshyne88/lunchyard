class Types::VendorConnection < Types::BaseConnection
  graphql_name "VendorConnection"
  edge_type(Types::VendorEdgeType)
end
