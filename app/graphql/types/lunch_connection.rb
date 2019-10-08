class Types::LunchConnection < Types::BaseConnection
  graphql_name "LunchConnection"
  edge_type(Types::LunchEdgeType)

  field :total_count, Integer, null: false

  def total_count
    object.nodes.size
  end
end
