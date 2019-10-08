class Types::DishConnection < Types::BaseConnection
  graphql_name "DishConnection"
  edge_type(Types::DishEdgeType)

  field :total_count, Integer, null: false

  def total_count
    object.nodes.size
  end
end
