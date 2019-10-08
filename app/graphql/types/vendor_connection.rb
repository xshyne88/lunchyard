class Types::VendorConnection < Types::BaseConnection
  graphql_name "VendorConnection"
  edge_type(Types::VendorEdgeType)

  field :total_count, Integer, null: false

  def total_count
    object.nodes.size
  end
end
