class Types::LunchDishConnection < Types::BaseConnection
  graphql_name "LunchDishConnection"
  edge_type(Types::LunchDishEdgeType)

  field :total_count, Integer, null: false

  def total_count
    object.nodes.size
  end
end
