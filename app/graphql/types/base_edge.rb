class Types::BaseEdge < GraphQL::Types::Relay::BaseEdge
  description "An edge in a connection."

  class << self
    # Get or set the Object type that this edge wraps.
    #
    # @param node_type [Class] A `Schema::Object` subclass
    def node_type(node_type = nil)
      if node_type
        @node_type = node_type
        field :node, node_type, null: false, description: "The item at the end of the edge."
      end
      @node_type
    end
  end

  field :cursor, String,
    null: false,
    description: "A cursor for use in pagination."
end
