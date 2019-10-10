class Types::BaseConnection < GraphQL::Types::Relay::BaseConnection
  def self.edge_type(edge_type_class, edge_class: GraphQL::Relay::Edge, node_type: edge_type_class.node_type, nodes_field: true)
    # Set this connection's graphql name
    node_type_name = node_type.graphql_name

    @node_type = node_type
    @edge_type = edge_type_class

    field :edges, [edge_type_class],
      null: false,
      description: "A list of edges.",
      method: :edge_nodes,
      edge_class: edge_class

    field :nodes, [node_type],
      null: false,
      description: "A list of nodes." if nodes_field

    field :total_count, Integer,
      null: false,
      description: "Total objects number of items"

    def total_count
      object.nodes.size
    end

    description("The connection type for #{node_type_name}.")
  end
end
